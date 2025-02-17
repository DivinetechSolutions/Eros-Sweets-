import React, { useRef } from 'react';
import jsPDF from 'jspdf';
import 'jspdf-autotable';
import './Export.css'

const ExportPDF = () => {
  const nameRef = useRef();
  const detailsRef = useRef();

  const handleDownload = () => {
    const doc = new jsPDF();

    // Get values from refs
    const name = nameRef.current.innerText;
    const details = detailsRef.current.innerText;

    // Add content to PDF with formatting
    doc.setFontSize(20);
    doc.text('User Information', 20, 20);

    doc.setFontSize(12);
    doc.text(`Name: ${name}`, 20, 40);
    doc.text(`Details: ${details}`, 20, 60);

    // Example: Adding a table
    doc.autoTable({
      head: [['Key', 'Value']],
      body: [
        ['Name', name],
        ['Details', details],
      ],
      startY: 80,
    });

    // Save the PDF
    doc.save('formatted-data.pdf');
  };

  return (
  
    <div class="invoice-container">
    <h2 class="invoice-title">TAX INVOICE</h2>
    <p class="company-name">EDUMALL ENTERPRISE LLP.</p>
    <p class="company-address">Shivam Park, St. No 2 Corner, Opp. Ajmera Shashtri Nagar, Nana Mauva Main Road, Rajkot, 360005</p>
    <p class="company-gst">GST NO: 24AAKFE7301C1ZY</p>

    

    <div class="invoice-details">
        <p><strong>Invoice No.:</strong> 24-25/EDU-2840</p>
        <p><strong>Date:</strong> 08/02/2025</p>
        <p><strong>Time:</strong> 04:43:52 PM</p>
        <p><strong>Cashier Name:</strong> Ground Floor Cashier</p>
    </div>



    <div class="customer-details">
        <p><strong>Customer Name:</strong> Heer Chauhan</p>
        <p><strong>Phone:</strong> 8488819543</p>
    </div>

    

    <table class="invoice-table">
        <thead>
            <tr>
                <th>Item</th>
                <th>Qty</th>
                <th>Tax</th>
                <th>Discount</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>S RUB BROCH KIDS PANDA METAL</td>
                <td>4</td>
                <td>18%</td>
                <td>50</td>
                <td>160</td>
            </tr>
            <tr>
                <td>S STICKER 205 STICKER QS DD 30</td>
                <td>1</td>
                <td>18%</td>
                <td>3</td>
                <td>27</td>
            </tr>
            <tr>
                <td>S STICKERS RUB FLUORESCENT TOYS</td>
                <td>1</td>
                <td>18%</td>
                <td>13</td>
                <td>52</td>
            </tr>
        </tbody>
    </table>

   
    <div class="invoice-summary">
        <p><strong>Net Invoice Amount:</strong> ₹239</p>
        <p><strong>Payment Mode:</strong> Cash</p>
        <p><strong>Amount in Words:</strong> Two Hundred Thirty-Nine Only</p>
    </div>

  

    <div class="terms">
        <p><strong>Terms & Conditions:</strong></p>
        <ul>
            <li>All Sales are final. Goods cannot be returned once sold.</li>
            <li>Any damage must be reported within 24 hours of receipt.</li>
            <li>Any disputes will be subject to the jurisdiction of Rajkot, Gujarat only.</li>
        </ul>
    </div>

    <p class="invoice-footer">Thank You! Visit Again!</p>
</div>


  );
};

export default ExportPDF;
