import { Route, Routes } from 'react-router-dom'
import './App.css'
import Bell from './RoutePages/Bell'
import Category from './RoutePages/Category'
import SettingProduct from './RoutePages/SettingProduct'
import Order from './RoutePages/Order'
import Product from './RoutePages/Product'
import Layout from './Components/Layout'
// import MainSection from './Components/MainSection'
import AddProduct from './RoutePages/AddProduct'
import EditForm from './RoutePages/EditForm'
import { ToastContainer  } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import React from "react";
import OrderDetail from './RoutePages/OrderDetail'
import ProductDescription from './RoutePages/ProductDescription'
import CategoryProduct from './RoutePages/CategoryProduct'
import Team from './RoutePages/Team'
import AdminHome from './RoutePages/AdminHome'
import TeamAdd from './RoutePages/TeamAdd'
import Inventory from './RoutePages/Inventory'

function App() {


  return (
    <>
    <ToastContainer/>
    <Routes>
      <Route path='/' element={<Layout/>} >
           <Route path='/' element={<AdminHome/>} />
           <Route path='/notification' element={<Bell/>}/>
           <Route path='/category' element={<Category/>}/>
           <Route path='/product' element={<Product/>}/>
           <Route path='/add-product' element={<AddProduct/>}/>
           <Route path='/edit/:_id' element={<EditForm/>}/>
           <Route path='/setting-product' element={<SettingProduct/>}/>
           <Route path='/order-detail' element={<OrderDetail/>}/>
           <Route path='/product-description/:_id' element={<ProductDescription/>}/>
           <Route path='/category-product/:name' element={<CategoryProduct/>}/>
           <Route path='/team' element={<Team/>}/>
           <Route path='/team-add' element={<TeamAdd/>}/>
           <Route path='/order' element={<Order/>}/>
           <Route path='/inventory' element={<Inventory/>}/>


      </Route>

    </Routes>
   
    </>
  )
}

export default App
