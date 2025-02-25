import React, { useState } from "react";
import "./Navbar.css";
// import MainSection from "./MainSection";
import { Link , useNavigate , useLocation } from "react-router-dom";
import{PanelTopClose} from 'lucide-react'


const Navbar = ({Togglefunction}) => {
  const [data, setData] = useState(5);
  const navigate = useNavigate()

  const ShowUser = ()=>{
    let profile =  document.querySelector(".id-box");
    profile.classList.toggle("show");

  }

  const [isSidebarOpen, setIsSidebarOpen] = useState(true);
  const location = useLocation();
 
  

  const [showName , setshowName] =useState(true);
// Function to toggle the sidebar visibility
// const toggleSidebar = () => {
//   setIsSidebarOpen(!isSidebarOpen);
// };



  return (
    <>
    <nav className="navbar">

    <div className="menu-button-box">
<h4 className="menu-button-admin" onClick={Togglefunction} >{Togglefunction ? <PanelTopClose size={32}   className='open-menu-icon'/> :<PanelTopClose size={32}  className='close-menu-icon'/>}</h4>

</div>
      <div className="navbar-logo">
        
       <img src="./public/images/Eros-logo.png"  onClick={()=>navigate('/')} />
      </div>


      <div className="icon-box">
      {/* <i className="ri-message-3-line" id="icon"></i> */}
     
      <Link to='/notification'><i className="fa-regular fa-bell" id="icon"></i></Link>
      <span className="bell">{data}</span>

      <div className="profile" onClick={ShowUser}>
          <div className="avatar">N</div>
          <p>Nidhi Patel</p>
          <i className="fa-solid fa-angle-down down" id="icon"></i>
        </div>
      </div>
    </nav>
    <div className="id-box ">
    <div className="avatar">D</div>
    <p>Demo User</p>
        </div>
    
    
    </>
  );
};

export default Navbar
