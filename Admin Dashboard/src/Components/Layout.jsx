// import React from 'react'
import Navbar from './Navbar'
// import { Outlet } from 'react-router-dom'
// const Layout = () => {
//   return (
//     <>
//     <Navbar/>
//     <Outlet/>
//     </>
//   )
// }

// export default Layout



import React from 'react'
import './Layout.css'
import { NavLink, Outlet, useLocation } from 'react-router-dom'
import { useState } from 'react'


const Layout = () => {
    const location = useLocation();
   
    

    const [isSidebarOpen, setIsSidebarOpen] = useState(true);
    const [showName , setshowName] =useState(true);
  // Function to toggle the sidebar visibility
  const toggleSidebar = () => {
    setIsSidebarOpen(!isSidebarOpen);
  };
  const nameset = () => {
    setshowName(!showName);
  };


  return (
    <>
    <div className="layout_main_body">
    <aside>
        
        <div className='main-navbar'>
             <Navbar/>
    
        </div>
        <div className={`sidebar ${isSidebarOpen ? 'open' : 'closed'}`}>
           
            <h4 className={isSidebarOpen ? 'close-btn' : 'closed-menu-btn'} onClick={()=>{
              toggleSidebar()
              nameset()
              }}><i class="fa-solid fa-bars" ></i></h4>
            
            <div id={isSidebarOpen ? 'sidebar_links' : 'sidebar_links-closed'}>
            


                <NavLink to='/' className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} >
                 <i class="fa-solid fa-home"></i> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Dashboard</span>
                </NavLink>
             
                <NavLink to='/product' className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} >
                 <i class="fa-solid fa-tag"></i> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Products</span>
                </NavLink>
               
                <NavLink to='/category' className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} >
                 <i class="fa-solid fa-file"></i> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Categories</span>
                </NavLink>
               
                <NavLink to='/setting-product' className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} >
                 <i class="fa-solid fa-user"></i> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Profile</span>
                </NavLink>
    
             
                

                
            
            </div>
        </div>
    </aside>
    
    <main className={`main-content ${isSidebarOpen ? "sidebar-open" : "sidebar-closed"}`}>
        
        
        <Outlet/>
    </main>
    </div>
    </>
  )
}

export default Layout