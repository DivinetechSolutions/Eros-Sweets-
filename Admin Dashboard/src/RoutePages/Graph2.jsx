import React from "react";
import "./Graph2.css";
import { BarChart, Bar, XAxis, YAxis, Tooltip, Legend, ResponsiveContainer } from "recharts";

const data = [
  { month: "Jan", revenue: 30000, profit: 25000 },
  { month: "Feb", revenue: 35000, profit: 27000 },
  { month: "Mar", revenue: 40000, profit: 28000 },
  { month: "Apr", revenue: 28000, profit: 26000 },
  { month: "May", revenue: 32000, profit: 29000 },
  { month: "Jun", revenue: 39000, profit: 31000 },
  { month: "Jul", revenue: 27000, profit: 23000 },
  { month: "Aug", revenue: 33000, profit: 27000 },
  { month: "Sep", revenue: 35000, profit: 26000 },
  { month: "Oct", revenue: 38000, profit: 28000 },
  { month: "Nov", revenue: 39000, profit: 29000 },
  { month: "Dec", revenue: 40000, profit: 30000 },
];

const EarningsGraph = () => {
  return (
    <div className="earnings-container">
      <h3 className="earnings-title">Earnings</h3>
      <div className="earnings-summary">
        <div className="profit-text">
          <span className="revenue-label">Revenue</span>
          <h3 className="earnings-value">$37,802</h3>
          <span className="growth-rate">⬆ 0.56%</span>
        </div>
        <div className="profit-text">
          <span className="profit-label">Profit</span>
          <h3 className="earnings-value">$28,305</h3>
          <span className="growth-rate">⬆ 0.56%</span>
        </div>
      </div>
      <ResponsiveContainer width="100%" height={280}>
        <BarChart data={data} margin={{ top: 10, right: 30, left: 0, bottom: 0 }}>
          <XAxis dataKey="month" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Bar dataKey="revenue" fill="#8B0000" barSize={30}  radius={6}/>
          <Bar dataKey="profit" fill="#D87093" barSize={30} radius={6}/>
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
};

export default EarningsGraph;
