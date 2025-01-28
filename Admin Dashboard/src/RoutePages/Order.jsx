import React from 'react'
import { useState, useEffect } from 'react'
import './Order.css'
import { useNavigate, Link } from 'react-router-dom'
import axios from 'axios'




const Order = () => {

  const navigate = useNavigate();



  const [product2, setProducts] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 7;
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedOptions, setSelectedOptions] = useState([]);
  const [isOpen, setIsOpen] = useState(false);
  const [selectedProduct, setSelectedProduct] = useState(null); // State to hold selected product for editing
  const [editId, setEditId] = useState(null);

  const [formData, setFormData] = useState({
    ProductName: '',
    ProductDescription: '',
    ProductIngredients: '',
    ProductWeight: '',
    Price: '',
    ShelfLife: '',
    Category: '',
    StateOrigin: '',
    ProductImage: '',
  });


  const options = [
    { id: "sweet", label: "Sweet" },
    { id: "namkeen", label: "Namkeen" },
    { id: "sugar_free", label: "Sugar Free" },
    { id: "sweet_hamper", label: "Sweet Hampers" },
    { id: "namkeen_hampers", label: "Namkeen Hampers" },
    { id: "corporate_collection", label: "Corporate Collection" },
    { id: "wedding_collection", label: "Wedding Collection" },
    { id: "combos", label: "Combos" },
  ];

  useEffect(() => {
    fetchProducts();
  }, []);

  const fetchProducts = async () => {
    try {
      const response = await axios.get('http://localhost:5000/product');
      setProducts(response.data);
    } catch (error) {
      console.error('Error fetching products:', error);
    }
  };

  const filteredProducts = product2.filter(product => {
    const matchesSearch = product.ProductName.toLowerCase().includes(searchQuery.toLowerCase());
    const matchesCategory =
      selectedOptions.length === 0 ||
      selectedOptions.includes(product.Category.toLowerCase());
    return matchesSearch && matchesCategory;
  });


  const indexOfLastProduct = currentPage * itemsPerPage;
  const indexOfFirstProduct = indexOfLastProduct - itemsPerPage;
  const currentProducts = filteredProducts.slice(indexOfFirstProduct, indexOfLastProduct);
  const totalPages = Math.ceil(filteredProducts.length / itemsPerPage);

  const handleSearch = (e) => {
    setSearchQuery(e.target.value);
    setCurrentPage(1);
  };

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  const handleDelete = async (id) => {



    try {
      await axios.delete(`http://localhost:5000/product/${id}`);
      toast.success('Product deleted successfully!');
      fetchProducts();
    } catch (error) {
      console.error('Error deleting product:', error);
      alert('Failed to delete product.');
    }
  };

  const handleCheckboxChange = (id) => {
    setSelectedOptions((prev) =>
      prev.includes(id) ? prev.filter((option) => option !== id) : [...prev, id]
    );
  };

  const toggleDropdown = () => {
    setIsOpen((prevState) => !prevState);
  };

  const handleEdit = (product) => {
    navigate('/add-form')
    setEditId(product._id); // Set the ID for updating
    setFormData({ ...product });

  };

  const handleCancelEdit = () => {
    setSelectedProduct(null);
  }


  return (
    <div className='main-box'>
      <div className="top-bar">
        <button className="back-btn" onClick={() => navigate(-1)}>
          <i className="fa-solid fa-chevron-left"></i>
        </button>
        <p>Order</p>
        <div className="top-right">
          <button className="btn-export">Export</button>
          <button>
            <Link to="/add-product" style={{ color: "#fff" }}>
              <i className="fa-solid fa-plus"></i> Add Order
            </Link>
          </button>
        </div>
      </div>

      <div className="four-card">
        <div className="crd">
          <div className="crd-left">
            <p>Processing</p>
            <h2>1,202</h2>
            <p className='progress'><span>10%</span><i class="fa-solid fa-caret-up" style={{color:"green"}}></i>+120today</p>
          </div>
          <div className="crd-right">
          <div className="icon-box">
          <i class="fa-solid fa-box " style={{color:"#FFF"}}></i></div>
          </div>
        </div>
        <div className="crd"> <div className="crd-left">
            <p>Shipped</p>
            <h2>1,202</h2>
            <p className='progress'><span>10%</span><i class="fa-solid fa-caret-up" style={{color:"green"}}></i>+120today</p>
          </div>
          <div className="crd-right">
          <div className="icon-box" style={{backgroundColor:"#3250FF"}}>
          <i class="fa-solid fa-truck-fast" style={{color:"#FFF"}}></i></div>
          </div>
          </div>
        <div className="crd"> <div className="crd-left">
            <p>Deliverd</p>
            <h2>1,202</h2>
            <p className='progress'><span>10%</span><i class="fa-solid fa-caret-up" style={{color:"green"}}></i>+120today</p>
          </div>
          <div className="crd-right">
          <div className="icon-box" style={{backgroundColor:"#2BB2FE"}}>
          <i class="fa-solid fa-cart-arrow-down" style={{color:"#FFF"}}></i></div>
          </div></div>
        <div className="crd"> <div className="crd-left">
            <p>Cancled</p>
            <h2>1,202</h2>
            <p className='progress'><span>10%</span><i class="fa-solid fa-caret-up" style={{color:"green"}}></i>+120today</p>
          </div>
          <div className="crd-right">
          <div className="icon-box"  style={{backgroundColor:"#EB3D4D"}}>
          <i class="fa-solid fa-circle-xmark" style={{color:"#FFF"}}></i></div>
          </div></div>
      </div>


      <div className="main-bar">
        <div className="search-div2">
          <div className="two-option">
          <div className="filter2">
            <div className="custom-dropdown">
              <button className="dropdown-btn" onClick={toggleDropdown}>
                Filter
                <i className="fa-solid fa-angle-down down" style={{ marginLeft: "80px" }}></i>
              </button>
              {isOpen && (
                <div className="dropdown-menu" onMouseLeave={toggleDropdown}>
                  <ul>
                    {options.map((option) => (
                      <li key={option.id}>
                        <input
                          type="checkbox"
                          id={option.id}
                          value={option.id}
                          checked={selectedOptions.includes(option.id)}
                          onChange={() => handleCheckboxChange(option.id)}
                        />
                        <label htmlFor={option.id}>{option.label}</label>
                      </li>
                    ))}
                  </ul>
                </div>
              )}
            </div>
          </div>

          <div className="search">

            <div className='search-input'>
              <i className="fa-solid fa-search" style={{marginRight:"15px"}}></i>
              <input
                type="text"
                placeholder="Search..."
                value={searchQuery}
                onChange={handleSearch}
              />
            </div>

          </div>
          </div>
          <div className="edit-icon">
              <button className="edit2">
                <Link to='#' style={{ textDecoration: "none" }}>
                  <i className="fa-solid fa-pen" style={{ color: "blue" }}></i>
                </Link>
              </button>
              <button className="delete2" onClick={() => handleDelete()}>
                <i className="fa-solid fa-trash" style={{fontSize:"18px"}}></i>
              </button>
            </div>
        </div>

        <div className="product-list">
          <div className="product-table">
            <table>
              <thead>
                <tr>
                  <th> <input type="checkbox" name="Product" id="product"  style={{marginRight:"15px"}}/>Product</th>
                  <th>Product Name</th>
                  <th>Date</th>
                  <th>Customer</th>
                  <th>Price</th>
                  <th>Payment Status</th>
                  <th>Order Status</th>

                </tr>
              </thead>
              <tbody>
                {currentProducts.map((product, index) => (
                  <tr key={index}>
                    <td style={{ justifyContent:"center"}}><input type="checkbox"  style={{marginRight:"15px"}}/>#234896</td>
                    <td className="product-details">
                      <img src={product.ProductImage} alt={product.ProductName} />
                      <div>
                        <div className="product-name">{product.ProductName}</div>
                        <div className="product-category">{product.Category}</div>
                      </div>
                    </td>
                    <td>May 5, 4:20 PM</td>
                    <td>Divayaraj Shinh</td>
                    <td>{product.Price}</td>
                    <td><p className='pymt-status'>Paid</p></td>
                    <td><p className='order-status'>Delivered</p></td>
                  </tr>
                ))}
              </tbody>
            </table>

            <div className="pagination">
              <div>
                <button
                  disabled={currentPage === 1}
                  onClick={() => handlePageChange(currentPage - 1)}
                >
                  <i className="fa-solid fa-arrow-left"></i>
                </button>

                {[...Array(totalPages).keys()].map((page) => (
                  <button
                    key={page + 1}
                    style={{ color: currentPage === page + 1 ? '#9D0910' : '#5c5a5a' }}
                    onClick={() => handlePageChange(page + 1)}
                  >
                    {page + 1}
                  </button>
                ))}

                <button
                  disabled={currentPage === totalPages}
                  onClick={() => handlePageChange(currentPage + 1)}
                >
                  <i className="fa-solid fa-arrow-right"></i>
                </button>
              </div>
              <span style={{ color: "#5c5a5a", marginRight: "15px" }}>{filteredProducts.length} Result</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Order