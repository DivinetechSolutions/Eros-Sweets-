import mongoose from 'mongoose';
import express from 'express';
import cors from 'cors';


const app = express();


// Middleware setup
app.use(cors());
app.use(express.json());

// MongoDB connection string
const uri = "mongodb+srv://Nidhi:Nidhi16@sweetnamkeen.3md1r.mongodb.net/SweetNamkeen?retryWrites=true&w=majority&appName=SweetNamkeen";

// Define the schema and model
const ProductSchema = new mongoose.Schema({
  ProductName: String,
  ProductDescription: String,
  ProductIngredients: String,
  ProductWeight: String,
  Price: String,
  ShelfLife: String,
  ProductImage: String,
  Category: String,
  StateOrigin: String,
  ProductNutritions :String,
  StorageInstruction :String,
});

const CategorySchema = mongoose.Schema({
name :  String,
image : String,
});

const Category = mongoose.model('Category' , CategorySchema , 'category')

const Product = mongoose.model('Product', ProductSchema, 'sweet');

app.get('/cat', async (req , res)=>{
  try {
    const cat = await Category.find();
    res.json(cat);
  } catch (error) {
    console.log(error);
    
  }
})



app.get('/category2', async (req, res) => {
  try {
    const categories = await Product.aggregate([
      { $group: { _id: "$Category", count: { $sum: 1 } } },
      { $sort: { _id: 1 } } // Optional: Sort alphabetically by category
    ]);
    res.json(categories);
  } catch (err) {
    res.status(500).send(err.message);
  }
});

app.get('/category', async (req, res) => {
  try {
    const categories = await Category.aggregate([
      {
        $lookup: {
          from: "products", // The collection name in MongoDB (must match the DB name)
          localField: "name", // The field in Category model
          foreignField: "Category", // The field in Product model
          as: "products"
        }
      },
      {
        $project: {
          _id: 1,
          name: 1,
          image: 1,
          count: { $size: "$products" } // Count number of products in each category
        }
      }
    ]);

    res.json(categories);
  } catch (err) {
    res.status(500).send(err.message);
  }
});


// Connect to MongoDB
mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connected to MongoDB Atlas using Mongoose!');
  })
  .catch((error) => {
    console.error('Error connecting to MongoDB:', error);
  });
  

// API endpoints

// 1. Fetch all products (READ)
app.get('/product', async (req, res) => {
  try {
    const products = await Product.find(); // Fetch all products
    res.json(products); // Send products as JSON response
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch products' });
  }
});

app.get('/product/:id', async (req, res) => {
  try {
    const productId = req.params.id; // Extract the product ID from the URL
    const product = await Product.findById(productId); // Query the database by ID

    if (!product) {
      return res.status(404).json({ message: 'Product not found' });
    }

    res.status(200).json(product); // Send the specific product as a response
  } catch (error) {
    console.error('Error fetching product:', error);
    res.status(500).json({ message: 'Server error' });
  }
});




// 2. Add a new product (CREATE)
app.post('/product', async (req, res) => {
  try {
    const product = new Product(req.body); // Create a new product from request body
    await product.save(); // Save the product to the database
    res.status(201).json(product); // Respond with the created product
  } catch (error) {
    res.status(400).json({ error: 'Failed to create product', details: error.message });
  }
});

// 3. Update an existing product by ID (UPDATE)
app.put('/product/:id', async (req, res) => {
  try {
    const { id } = req.params; // Extract the product ID from the route
    const updatedProduct = await Product.findByIdAndUpdate(id, req.body, { new: true }); // Update the product
    if (!updatedProduct) {
      return res.status(404).json({ error: 'Product not found' });
    }
    res.json(updatedProduct); // Respond with the updated product
  } catch (error) {
    res.status(400).json({ error: 'Failed to update product', details: error.message });
  }
});

// 4. Delete a product by ID (DELETE)
app.delete('/product/:id', async (req, res) => {
  try {
    const { id } = req.params; // Extract the product ID from the route
    const deletedProduct = await Product.findByIdAndDelete(id); // Delete the product
    if (!deletedProduct) {
      return res.status(404).json({ error: 'Product not found' });
    }
    res.json({ message: 'Product deleted successfully', product: deletedProduct });
  } catch (error) {
    res.status(400).json({ error: 'Failed to delete product', details: error.message });
  }
});




// Start the server
const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
