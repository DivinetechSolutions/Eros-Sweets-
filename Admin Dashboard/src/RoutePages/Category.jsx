import React, { useEffect, useState } from 'react'
import './Category.css'
import axios from 'axios'
import { Link, useNavigate } from 'react-router-dom'

const Category = () => {

  const [data, setData]= useState([]);
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const response = await fetch("http://localhost:5000/category");
        const data = await response.json();
        setCategories(data);
      } catch (error) {
        console.error("Error fetching categories:", error);
      }
    };

    fetchCategories();
  }, []);


  useEffect(()=>{
    fetchData();
  })

  
  const fetchData = async()=>{
    const response = await axios.get('http://localhost:5000/product');
    setData(response.data);
  }

  // const Items3 = [
  //   {"img" : "https://tse2.mm.bing.net/th?id=OIP.TR6gVZG-S4YxWTyGXxAHiwHaFk&pid=Api&P=0&h=180",
  //    "Category" : "Sweet",
  //    "quantity" : 24, 
  //   },

    
  //     {
  //       "img": "https://tse2.mm.bing.net/th?id=OIP.TR6gVZG-S4YxWTyGXxAHiwHaFk&pid=Api&P=0&h=180",
  //       "Category": "Sweet",
  //       "quantity": 24
  //     },
  //     {
  //       "img": "https://tse2.mm.bing.net/th?id=OIP.ALNVrDctDELKjmqSe9uniQHaFh&pid=Api&P=0&h=180",
  //       "Category": "Sweet",
  //       "quantity": 15
  //     },
  //     {
  //       "img": "https://tse1.mm.bing.net/th?id=OIP.NUBrnKyNWYaGiMDFR0YPqAHaHa&pid=Api&P=0&h=180",
  //       "Category": "Sweet",
  //       "quantity": 30
  //     },
  //     {
  //       "img": "https://tse1.mm.bing.net/th?id=OIP.NUBrnKyNWYaGiMDFR0YPqAHaHa&pid=Api&P=0&h=180",
  //       "Category": "Namkeen",
  //       "quantity": 50
  //     },
  //     {
  //       "img": "https://tse1.mm.bing.net/th?id=OIP.NUBrnKyNWYaGiMDFR0YPqAHaHa&pid=Api&P=0&h=180",
  //       "Category": "Namkeen",
  //       "quantity": 20
  //     },
  //     {
  //       "img": "https://tse1.mm.bing.net/th?id=OIP.NUBrnKyNWYaGiMDFR0YPqAHaHa&pid=Api&P=0&h=180",
  //       "Category": "Namkeen",
  //       "quantity": 35
  //     },
  //     {
  //       "img": "https://tse1.mm.bing.net/th?id=OIP.NUBrnKyNWYaGiMDFR0YPqAHaHa&pid=Api&P=0&h=180",
  //       "Category": "Sweet",
  //       "quantity": 18
  //     },
  //     {
  //       "img": "https://tse1.mm.bing.net/th?id=OIP.NUBrnKyNWYaGiMDFR0YPqAHaHa&pid=Api&P=0&h=180",
  //       "Category": "Namkeen",
  //       "quantity": 25
  //     }
  //   ]
    
  

  const navigate = useNavigate();
  return (
    <div className='category-container'>
      <div className="top-bar">
          <button className="back-btn" onClick={() => navigate(-1)}><i className="fa-solid fa-chevron-left"></i></button>
          <p>Categories</p>
          <div className="top-right">
            <button ><Link to="#" style={{color:"#fff"}}><i className="fa-solid fa-plus add-btn"></i> Add Category</Link></button>
          </div>
        </div>

        <div className="product-card-container">
       
       {
         categories.map((e , indexe)=>
          {
          
            return(
              <div className="category-card" id={indexe}>
             <div className="card-image">
             <img src={e.firstImage}/>

            </div>
            <div className="name-size">
            <h4 className='ans-card'>{e._id || "Uncategorized"}</h4>
            <p className='ans-card'>{e.count} items</p>
           </div>
           </div>
            )
         })

       }
           
        </div>
        
    </div>
  )
}

export default Category





// import React, { useEffect, useState } from "react";
// import "./Category.css"; // Import your external CSS file

// const Categories = () => {
//   const [categories, setCategories] = useState([]);
//   const [loading, setLoading] = useState(true);

//   useEffect(() => {
//     const fetchCategories = async () => {
//       try {
//         const response = await fetch("http://localhost:5000/category");
//         const data = await response.json();
//         setCategories(data);
//         setLoading(false);
//       } catch (error) {
//         console.error("Error fetching categories:", error);
//         setLoading(false);
//       }
//     };

//     fetchCategories();
//   }, []);

//   if (loading) {
//     return <p>Loading categories...</p>;
//   }

//   return (
//     <div>
//       <h1 className="heading">Category List</h1>
//       <table className="table">
//         <thead>
//           <tr>
//             <th className="table-header">Category</th>
//             <th className="table-header">Count</th>
//           </tr>
//         </thead>
//         <tbody>
//           {categories.map((category) => (
//             <tr key={category._id}>
//               <td className="table-cell">{category._id || "Uncategorized"}</td>
//               <td className="table-cell">{category.count}</td>
//             </tr>
//           ))}
//         </tbody>
//       </table>
//     </div>
//   );
// };

// export default Categories;
