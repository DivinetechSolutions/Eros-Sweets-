// import React from "react";
// import { LineChart, Line, XAxis, YAxis, Tooltip, Legend, CartesianGrid, BarChart, Bar } from "recharts";
// import "./Graph.css"; // Import external CSS

// const lineData = [
//   { time: "4am", May21: 10, May22: 20 },
//   { time: "5am", May21: 15, May22: 10 },
//   { time: "6am", May21: 12, May22: 25 },
//   { time: "7am", May21: 25, May22: 35 },
//   { time: "8am", May21: 30, May22: 34 },
//   { time: "9am", May21: 28, May22: 50 },
//   { time: "10am", May21: 40, May22: 38 },
//   { time: "11am", May21: 50, May22: 48 },
//   { time: "12pm", May21: 35, May22: 30 },
//   { time: "1pm", May21: 40, May22: 35 },
//   { time: "2pm", May21: 45, May22: 40 },
// ];

// const barData = [
//   { day: "12", sales: 1200 },
//   { day: "13", sales: 1500 },
//   { day: "14", sales: 1800 },
//   { day: "15", sales: 2525 },
//   { day: "16", sales: 2100 },
//   { day: "17", sales: 2300 },
//   { day: "18", sales: 2400 },
// ];

// const DashboardGraphs = () => {
//   return (
//     <div className="dashboard-container">
//       {/* Orders Over Time (Line Chart) */}
//       <div className="chart-container2">
//         <h2 className="chart-title">Orders Over Time</h2>
//         <LineChart width={800} height={400} data={lineData} className="line-chart">
//           <CartesianGrid strokeDasharray="3 3" />
//           <XAxis dataKey="time" />
//           <YAxis />
//           <Tooltip />
//           <Legend />
//           <Line type="monotone" dataKey="May21" stroke="#a3a3a3" strokeWidth={2} />
//           <Line type="monotone" dataKey="May22" stroke="#8b0000" strokeWidth={2} dot={{ r: 5 }} />
//         </LineChart>
//       </div>

//       {/* Last 7 Days Sales (Bar Chart) */}
//       <div className="chart-container2">
//         <h2 className="chart-title">Last 7 Days Sales</h2>
//         <BarChart width={450} height={400} data={barData}  >
//           <CartesianGrid strokeDasharray="3 3"  />
//           <XAxis dataKey="day" />
//           <YAxis />
//           <Tooltip />
//           <Bar dataKey="sales" fill="#00c853" barSize={18} radius={15} />
//         </BarChart>
//       </div>
//     </div>
//   );
// };

// export default DashboardGraphs;


import React from "react";
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  Tooltip,
  Legend,
  CartesianGrid,
  BarChart,
  Bar,
  ResponsiveContainer
} from "recharts";
import "./Graph.css"; // Import external CSS

const lineData = [
  { time: "4am", May21: 10, May22: 20 },
  { time: "5am", May21: 15, May22: 10 },
  { time: "6am", May21: 12, May22: 25 },
  { time: "7am", May21: 25, May22: 35 },
  { time: "8am", May21: 30, May22: 34 },
  { time: "9am", May21: 28, May22: 50 },
  { time: "10am", May21: 40, May22: 38 },
  { time: "11am", May21: 50, May22: 48 },
  { time: "12pm", May21: 35, May22: 30 },
  { time: "1pm", May21: 40, May22: 35 },
  { time: "2pm", May21: 45, May22: 40 },
];

const barData = [
  { day: "12", sales: 1200 },
  { day: "13", sales: 1500 },
  { day: "14", sales: 1800 },
  { day: "15", sales: 2525 },
  { day: "16", sales: 2100 },
  { day: "17", sales: 2300 },
  { day: "18", sales: 2400 },
];

const DashboardGraphs = () => {
  return (
    <div className="dashboard-container">
      {/* Orders Over Time (Line Chart) */}
      <div className="chart-container2">
        <h2 className="chart-title">Orders Over Time</h2>
        <ResponsiveContainer width="100%" height={300}>
          <LineChart data={lineData}  margin={{ top: 5, right: 0, left: 0, bottom: 5 }}>
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="time" padding={{ left: 0, right: 0 }}/>
            <YAxis />
            <Tooltip />
            <Legend />
            <Line type="monotone" dataKey="May21" stroke="#a3a3a3" strokeWidth={2} />
            <Line type="monotone" dataKey="May22" stroke="#8b0000" strokeWidth={2} dot={{ r: 5 }} />
          </LineChart>
        </ResponsiveContainer>
      </div>

      {/* Last 7 Days Sales (Bar Chart) */}
      <div className="chart-container2">
        <h2 className="chart-title">Last 7 Days Sales</h2>
        <ResponsiveContainer width="100%" height={300}>
          <BarChart data={barData}>
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="day" />
            <YAxis />
            <Tooltip />
            <Bar dataKey="sales" fill="#00c853" barSize={18} radius={15} />
          </BarChart>
        </ResponsiveContainer>
      </div>
    </div>
  );
};

export default DashboardGraphs;

