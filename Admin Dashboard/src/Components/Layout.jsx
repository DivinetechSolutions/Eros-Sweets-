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

import { Users , ChartColumnStacked , UserRoundPen ,AlignJustify , User , LayoutDashboard   } from 'lucide-react';
import { IconUserFilled } from '@tabler/icons-preact';
import React from 'react'
import './Layout.css'
import { NavLink, Outlet, useLocation } from 'react-router-dom'
import { useState } from 'react'
import { Tag } from 'lucide-react';


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
        <div id="sidebar-main" className={`sidebar ${isSidebarOpen ? 'open' : 'closed'}`}>
           
            <h4 className={isSidebarOpen ? 'close-btn' : 'closed-menu-btn'} onClick={()=>{
              toggleSidebar()
              nameset()
              }}><i className="fa-solid fa-bars"></i></h4>
            
            <div id={isSidebarOpen ? 'sidebar_links' : 'sidebar_links-closed'} className='sidebar-active' >
            


                <NavLink to='/' className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} title="Dashboard" >
                <LayoutDashboard className='nav-icon'/> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Dashboard</span>
                </NavLink>
             
                <NavLink to='/product' title="Products" className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'}  >
                <Tag className='nav-icon'/> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Products</span>
                </NavLink>
               
                <NavLink to='/category' title='Categories' className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} >
                 <ChartColumnStacked className='nav-icon'/> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Categories</span>
                </NavLink>
               
                <NavLink to='/setting-product' title='Customer'  className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} >
               <User className='nav-icon'/> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Customer</span>
                </NavLink>

                <NavLink to='/under-development' title="Team" className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} >
                <Users className='nav-icon'/> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Team</span>
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