

import React, { useState, useEffect } from 'react';
import './AdminHome.css';
import { DollarSign, ShoppingCart ,SquareUserRound} from 'lucide-react';
import { BarChart, Bar, XAxis, Tooltip, ResponsiveContainer } from "recharts";
import Graph from './Graph'
import Graph2 from './Graph2'
import Comment2 from './Comment2';
import axios from 'axios';



const CustomTooltip = ({ active, payload }) => {
    if (active && payload && payload.length) {
        return (
            <div className="custom-tooltip">
                <p className="tooltip-value">{payload[0].value}</p>
            </div>
        );
    }
    return null;
};

const GraphComponent = ({ data, color }) => {
    return (
        <div className="graph-container">
            <ResponsiveContainer width={100} height={80}>
                <BarChart data={data}>
                    <XAxis dataKey="name" hide />
                    <Tooltip content={<CustomTooltip />} />
                    <Bar dataKey="value" fill={color} radius={[5, 5, 0, 0]} />
                </BarChart>
            </ResponsiveContainer>
        </div>
    );
};

const AdminHome = ({ color }) => {
    const [products, setProducts] = useState([]);

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
    const myData = [
        { name: "A", value: 20 },
        { name: "B", value: 40 },
        { name: "C", value: 50 },
        { name: "D", value: 40 },
        { name: "E", value: 80 },
        { name: "harsh", value: 60 },
    ];

    const existingUsersData = [
        { name: "A", value: 40 },
        { name: "B", value: 60 },
        { name: "C", value: 90 },
        { name: "D", value: 110 },
        { name: "E", value: 80 },
    ];




    return (
        <div className='main-box'>
            <div className='dashboard-top-bar'>
                <h1 className='dash-txt'>Dashboard</h1>
                
            </div>

            <div className="box-container-div">
                <div className="data-box-card">
                    <div className="text-side">
                        <h4>$10.550</h4>
                        <p className='red-txt'>Total revenue</p>
                        <p className='green-txt'>22.45%^</p>
                    </div>

                    <div className="icon-side">
                        <span className='icon-back'><DollarSign size={32} /></span>
                    </div>
                </div>

                <div className="data-box-card">
                    <div className="text-side">
                        <h4>1,056</h4>
                        <p className='red-txt'>Orders</p>
                        <p className='green-txt'>15.35%^</p>
                    </div>
                    <div className="icon-side">
                        <span className='icon-back'><ShoppingCart size={32} /></span>
                    </div>
                </div>

                <div className="data-box-card">
                    <div className="text-side">
                        <h4>1.650</h4>
                        <p className='red-txt'>New Users</p>
                        <p className='green-txt'>22.45%^</p>
                    </div>
                    <div >
                        <GraphComponent data={myData} color="green" />
                    </div>
                </div>

                <div className="data-box-card">
                    <div className="text-side">
                        <h4>9.653</h4>
                        <p className='red-txt'>Existing Users</p>
                        <p className='green-txt'>10.45%^</p>
                    </div>
                    <div >
                        <GraphComponent data={existingUsersData} color="blue" />
                    </div>
                </div>
            </div>

            <div className="graph-section">
                
                <Graph />
            </div>

            <div className="third-section">
                <div className="transaction-box">
                    <h3>Recent Transactions</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Jagarnath.S</td>
                                <td>25-05-2024</td>
                                <td>$124.25</td>
                                <td><span className='status-span2'>Pending</span></td>
                            </tr>

                            <tr>
                                <td>Jagarnath.S</td>
                                <td>25-05-2024</td>
                                <td>$124.25</td>
                                <td><span className='status-span1'>Paid</span></td>
                            </tr>

                            <tr>
                                <td>Jagarnath.S</td>
                                <td>25-05-2024</td>
                                <td>$124.25</td>
                                <td><span className='status-span2'>Pending</span></td>
                            </tr>

                            <tr>
                                <td>Jagarnath.S</td>
                                <td>25-05-2024</td>
                                <td>$124.25</td>
                                <td><span className='status-span1'>Paid</span></td>
                            </tr>

                            <tr>
                                <td>Jagarnath.S</td>
                                <td>25-05-2024</td>
                                <td>$124.25</td>
                                <td><span className='status-span1'>Paid</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div className="unit-box">
                    <h3>Top Products by Sold Units</h3>

                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Units Sold</th>

                            </tr>
                        </thead>
                        <tbody>
                            {
                                
                                products.slice(10,13).map((e,index) => {
                                return(
                                    <tr key={index}>
                                        <td className="product-details">
                                            <img
                                                src={e.ProductImage[0]?.startsWith('http') ? e.ProductImage[0] : `http://localhost:5000${e.ProductImage || ''}`}
                                                alt={e.ProductName}
                                                className="product-image" />
                                            <span>{e.ProductName} &nbsp;</span>
                                            <span> ({e.Category})</span>
                                        </td>

                                        <td>{e.Price}</td>
                                        <td>118</td>
                                    </tr>
  


                                    );
                                })

                            
                            }
                        </tbody>
                    </table>
                </div>
            </div>


            <div className="fourth-section">
                <div className="shop-seller">
                    <h3>Best Shop Sellers</h3>
                    <table>
                        <thead>
                            <tr>
                                <th style={{width:"auto"}}>Shop</th>
                                <th>Categories</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td className='avatar-td'>
                                    <div className='avatar'>N</div>
                                    <div>
                                    <p className='td-name'>Jagarnath.S.</p>
                                    <span>83 purchases</span>
                                    </div>
                                </td>
                                <td>
                                    Kitchen, Pets
                                </td>

                                <td>
                                    $184.64
                                </td>
                            </tr>

                            <tr>
                                <td className='avatar-td'>
                                    <div className='avatar'>N</div>
                                    <div>
                                    <p className='td-name'>Jagarnath.S.</p>
                                    <span>83 purchases</span>
                                    </div>
                                </td>
                                <td>
                                    Kitchen, Pets
                                </td>

                                <td>
                                    $184.64
                                </td>
                            </tr>

                            <tr>
                                <td className='avatar-td'>
                                    <div className='avatar'>N</div>
                                    <div>
                                    <p className='td-name'>Jagarnath.S.</p>
                                    <span>83 purchases</span>
                                    </div>
                                </td>
                                <td>
                                    Kitchen, Pets
                                </td>

                                <td>
                                    $184.64
                                </td>
                            </tr>

                            <tr>
                                <td className='avatar-td'>
                                    <div className='avatar'>N</div>
                                    <div>
                                    <p className='td-name'>Jagarnath.S.</p>
                                    <span>83 purchases</span>
                                    </div>
                                </td>
                                <td>
                                    Kitchen, Pets
                                </td>

                                <td>
                                    $184.64
                                </td>
                            </tr>

                
                        </tbody>
                    </table>
                </div>
                <div className="earning-box">

                    <Graph2/>
                </div>
            </div>

            <div className='fifth-section'>

                <div className="overview-box">
                    <h3>Product Overview</h3>

                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Product ID</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Sale</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td className='avatar-td'><div className='user-td'><SquareUserRound size={32} /></div> jagarnath.S.</td>
                                <td>#337</td>
                                <td>$124.87</td>
                                <td>28</td>
                                <td>On Sale</td>
                            </tr>
                            <tr>
                                <td className='avatar-td'><div className='user-td'><SquareUserRound size={32} /></div> jagarnath.S.</td>
                                <td>#337</td>
                                <td>$124.87</td>
                                <td>28</td>
                                <td>On Sale</td>
                            </tr>

                            <tr>
                                <td className='avatar-td'><div className='user-td'><SquareUserRound size={32} /></div> jagarnath.S.</td>
                                <td>#337</td>
                                <td>$124.87</td>
                                <td>28</td>
                                <td>On Sale</td>
                            </tr>

                            <tr>
                                <td className='avatar-td'><div className='user-td'><SquareUserRound size={32} /></div> jagarnath.S.</td>
                                <td>#337</td>
                                <td>$124.87</td>
                                <td>28</td>
                                <td>On Sale</td>
                            </tr>

                            <tr>
                                <td className='avatar-td'><div className='user-td'><SquareUserRound size={32} /></div> jagarnath.S.</td>
                                <td>#337</td>
                                <td>$124.87</td>
                                <td>28</td>
                                <td>On Sale</td>
                            </tr>

                     
                        </tbody>
                    </table>
                </div>
                <div className="comment-box1">
                    <Comment2/>
                </div>
            </div>
        </div>
    );
};

export default AdminHome;
