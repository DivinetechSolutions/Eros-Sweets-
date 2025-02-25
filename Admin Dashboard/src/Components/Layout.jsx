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

import { PanelTopClose } from 'lucide-react';
import { Users , ChartColumnStacked , UserRoundPen  , User , LayoutDashboard,Package ,House , Folder ,TicketPercent  ,Archive ,Settings    } from 'lucide-react';
import { IconUserFilled } from '@tabler/icons-preact';
import React from 'react'
import './Layout.css'
import { NavLink, Outlet, useLocation } from 'react-router-dom'
import { useState } from 'react'
import { Tag } from 'lucide-react';


const Layout = () => {
  const [isSidebarOpen, setIsSidebarOpen] = useState(true);
  const [isMobileMenu, setIsMobileMenu] = useState(true);
    const location = useLocation();
   
    

    const [showName , setshowName] =useState(true);
  // Function to toggle the sidebar visibility
   const toggleSidebar = () => {
    setIsSidebarOpen(!isSidebarOpen);
  };

  const MobileSidebar = ()=>{
    setIsMobileMenu(!isMobileMenu);
  
  }
  const nameset = () => {
    setshowName(!showName);
  };


  return (
    <>
    <div className="layout_main_body">
    <aside>
        
        <div className='main-navbar'>
             <Navbar  Togglefunction ={MobileSidebar} />
    
        </div>
        <div id={`sidebar-main${!isMobileMenu?'show':'hide'}`} className={`sidebar ${isSidebarOpen ? 'open' : 'closed'}`}>
           
            <h4 className={isSidebarOpen ? 'close-btn' : 'closed-menu-btn'} id='menu-btn-sidebar' onClick={()=>{
              toggleSidebar()
              nameset()
              }}>{isSidebarOpen ? <PanelTopClose size={32}   className='open-menu-icon'/> :<PanelTopClose size={32}  className='close-menu-icon'/>}</h4>
            
            <div id={isSidebarOpen ? 'sidebar_links' : 'sidebar_links-closed'} className='sidebar-active' >
            

                <NavLink to='/' className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} title="Dashboard" style={{textDecoration:"none"}} onClick={MobileSidebar}>
                <House  className='nav-icon'/> <span className={`${showName ?  'show-name' : 'hide-name' }`}
                
                >Dashboard</span>
                </NavLink>
             
                <NavLink to='/product' title="Products" className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} style={{textDecoration:"none"}}  onClick={MobileSidebar}>
                <Tag className='nav-icon'/> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Products</span>
                </NavLink>
               
                <NavLink to='/category' title='Categories' className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} style={{textDecoration:"none"}} onClick={MobileSidebar}>
                 <Folder  className='nav-icon'/> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Categories</span>
                </NavLink>
               
                <NavLink to='/setting-product' title='Customers'  className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'}style={{textDecoration:"none"}}  onClick={MobileSidebar}>
               <User className='nav-icon'/> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Customers</span>
                </NavLink>

                <NavLink to='/team' title="My Team" className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} style={{textDecoration:"none"}} onClick={MobileSidebar}>
                <Users className='nav-icon'/> <span className={`${showName ?  'show-name' : 'hide-name' }`}>My Team</span>
                </NavLink>

                <NavLink to='/inventory' title="Inventory" className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} style={{textDecoration:"none"}} onClick={MobileSidebar}>
                <Archive  className='nav-icon'  /> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Inventory</span>
                </NavLink>

                <NavLink to='/order' title="Order" className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} style={{textDecoration:"none"}} onClick={MobileSidebar}>
                <Package className='nav-icon'  /> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Order</span>
                </NavLink>

                <NavLink to='coupon' title="Coupon" className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} style={{textDecoration:"none"}} onClick={MobileSidebar}>
                <TicketPercent   className='nav-icon'  /> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Coupons</span>
                </NavLink>

                <NavLink to="settings" title="Setting" className={isSidebarOpen ? 'Dashboard-links' : 'closed-navlink'} style={{textDecoration:"none"}} onClick={MobileSidebar}>
                <Settings    className='nav-icon'  /> <span className={`${showName ?  'show-name' : 'hide-name' }`}>Settings</span>
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