

import React, { useEffect, useState } from 'react';
import './Category.css';
import axios from 'axios';
import { Link, useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';

const Category = () => {
  const [data, setData] = useState([]);
  const [data2, setData2] = useState([]);
  const [categories, setCategories] = useState([]);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [categoryName, setCategoryName] = useState(""); // State for category name
  const [files, setFiles] = useState([]); // State for selected images
  const [previews, setPreviews] = useState([]);
  const [image, setImage] = useState(null); // State for image previews

  useEffect(() => {
    const fetchdata = async () => {
      try {
        const response = await fetch("http://localhost:5000/category2");
        const data2 = await response.json();
        setData2(data2);
        console.log(data2)
      } catch (error) {
        console.error("Error fetching categories:", error);
      }
    };

    fetchdata();
  }, []);


  const fetchCategories = async () => {
    try {
      const response = await fetch("http://localhost:5000/category");
      const data = await response.json();
      setCategories(data);
    } catch (error) {
      console.error("Error fetching categories:", error);
    }
  };
  useEffect(() => {

    fetchCategories();
  }, []);


  const [catImage, setCatImage] = useState([]);
  useEffect(() => {
    fetchData();
  });

  const fetchData = async () => {
    const response = await axios.get('http://localhost:5000/product');
    setData(response.data);
  };

  const navigate = useNavigate();

  const handleImageChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      setImage(file);
    }
  };

  // Generate previews for selected images
  useEffect(() => {
    if (!files.length) return;

    let tmp = files.map((file) => URL.createObjectURL(file));
    setPreviews(tmp);

    // Cleanup memory
    return () => {
      tmp.forEach((url) => URL.revokeObjectURL(url));
    };
  }, [files]);

  // Function to clear form fields
  const clearForm = () => {
    setCategoryName(""); // Clear text input
    setFiles([]); // Clear selected files
    setPreviews([]); // Clear image previews
    document.getElementById("file").value = ""; // Reset file input
  };

  // const handleSave = async () => {
  //   if (!categoryName || files.length === 0) {
  //     alert("Please enter a category name and select an image.");
  //     return;
  //   }
  //   const formData = new FormData();
  //   formData.append("name", categoryName);
  //   files.forEach((file) => formData.append("image", file));

  //   try {
  //     const response = await axios.post("http://localhost:5000/category", formData, {
  //       headers: {
  //         "Content-Type": "multipart/form-data",
  //       },
  //     });

  //     if (response.status === 201) {
  //       alert("Category added successfully!");
  //       setIsModalOpen(false);
  //       clearForm();
  //       // Refresh categories
  //     }
  //   } catch (error) {
  //     console.error("Error adding category:", error);
  //     alert("Failed to add category.");
  //   }
  // };

  // const handleSave = async () => {
  //   if (!categoryName.trim()) {
  //     alert("Please enter a category name.");
  //     return;
  //   }

  //   try {
  //     const response = await axios.post("http://localhost:5000/category", { name: categoryName.trim() });

  //     if (response.status === 201) {
  //       alert("Category added successfully!");
  //       setIsModalOpen(false);
  //       clearForm();
  //       setCategories((prev) => [...prev, { name: categoryName }]); // Update state with new category
  //     }
  //   } catch (error) {
  //     console.error("Error adding category:", error);
  //     alert("Failed to add category.");
  //   }
  // };



  const handleSave = async () => {
    if (!categoryName.trim() || !image) {
      alert("Please enter a category name and select an image.");
      return;
    }

    const formData = new FormData();
    formData.append("name", categoryName.trim());
    if (image) {
      formData.append('image', image);
    }

    try {
      const response = await axios.post("http://localhost:5000/category", formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });

      if (response.status === 201) {
        toast.success("Category added successfully!");
        setIsModalOpen(false);
        clearForm();
        setCategories((prev) => [...prev, response.data]); // Update UI with new category
        fetchCategories();
      }
    } catch (error) {
      console.error("Error adding category:", error);
      toast.warning("Failed to add category.");
    }
  };


  const handleDelete = async (categoryId) => {
    const isConfirmed = window.confirm("Are you sure you want to delete this category?");
    try {
      
      if (isConfirmed) {
        const response = await axios.delete(`http://localhost:5000/category/${categoryId}`);
        toast.success("Category deleted successfully!");
        setCategories((prev) => prev.filter((category) => category._id !== categoryId)); // Remove category from state
      }
    } catch (error) {
      console.error("Error deleting category:", error);
      toast.warning("Failed to delete category.");
    }
  };


  return (
    <div className="category-container">
      {/* Background content with blur effect */}
      <div className={`content ${isModalOpen ? 'blur' : ''}`}>
        <div className="top-bar">
          <button className="back-btn" onClick={() => navigate(-1)}>
            <i className="fa-solid fa-chevron-left"></i>
          </button>
          <div className="top-right">
            <button onClick={() => setIsModalOpen(true)}>
              <i className="fa-solid fa-plus add-btn"></i> Add Category
            </button>

          </div>
        </div>

        <div className="product-card-container">
          {/* {categories.map((e, index) => (
            <div className="category-card" key={index} onClick={() => navigate(`/category-product/${(e.name)}`)}
>
              <div className="card-image">

                <img
                  src={e.image?.startsWith('http') ? e.image : `http://localhost:5000${e.image || ''}`}
                  alt={e.name}
                />

              </div>
              <div className="name-size">
                <div>
                <h4 className='ans-card'>{e.name || "Uncategorized"}</h4>


                {
                  (() => {
                    const matchedCategory = data2.find((c) => c._id.trim().toLowerCase() === e.name.trim().toLowerCase());

                    return matchedCategory ? (
                      <p className='ans-card'>{matchedCategory.count} items</p>
                    ) : (
                      <p className='ans-card'>0 items</p>
                    );
                  })()
                }
                </div>
              
              <button>delete</button>
              </div>
            </div>
          ))} */}

          {categories.map((e, index) => (
            <div className="category-card" key={index} >
              <div className="card-image" onClick={() => navigate(`/category-product/${(e.name)}`)}>
                <img
                  src={e.image?.startsWith('http') ? e.image : `http://localhost:5000${e.image || ''}`}
                  alt={e.name}
                />
              </div>
              <div className="name-size">
                <div>
                  <h4 className='ans-card'>{e.name || "Uncategorized"}</h4>

                  {(() => {
                    const matchedCategory = data2.find((c) => c._id.trim().toLowerCase() === e.name.trim().toLowerCase());
                    return matchedCategory ? (
                      <p className='ans-card'>{matchedCategory.count} items</p>
                    ) : (
                      <p className='ans-card'>0 items</p>
                    );
                  })()}
                </div>
                <button className='category-delete-btn' onClick={() => handleDelete(e._id)}>Delete</button>
              </div>
            </div>
          ))}

        </div>
      </div>

      {/* Modal */}
    
      {isModalOpen && (
  <div 
    className="modal-overlay" 
    onClick={(e) => {
      if (e.target.classList.contains("modal-overlay")) {
        setIsModalOpen(false);
      }
    }}
  >
    <div className="modal-content">
      <div className='text-div'>
        <h2>Add Category</h2>
        <i className="fa-solid fa-xmark" onClick={() => setIsModalOpen(false)}></i>
      </div>
      <form>
        <label>Category Name</label>
        <input
          type="text"
          placeholder="Category Name"
          value={categoryName}
          onChange={(e) => setCategoryName(e.target.value)}
        />

        <div className="file-box">
          <h3 style={{ marginTop: '10px' }}>Images</h3>
          <div className="img-box">
            <input
              type="file"
              id="file"
              accept="image/png, image/jpeg, image/jpg"
              onChange={handleImageChange}
            />
            <label htmlFor="file">Add File</label>
            <span>Or drag and drop files</span>
          </div>
        </div>
      </form>

      <div className='button-box'>
        <button type="button" className='clear-btn' onClick={clearForm}>Clear</button>
        <button className="close-button" onClick={handleSave}>Save</button>
      </div>
    </div>
  </div>
)}




    </div>
  );
};

export default Category;
