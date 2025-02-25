

import React, { useRef } from 'react';
import './TeamAdd.css';
import { Camera } from 'lucide-react';

const TeamAdd = () => {
  const fileInputRef = useRef(null);

  const handleClick = () => {
    fileInputRef.current.click(); // Trigger file input when clicking the camera icon
  };

  return (
    <div className='main-box'>
      <div className='dashboard-top-bar'>
        <h2 className='dash-txt'>Add Team Member</h2>
      </div>

      <div className="add-member-box">
        <div className="camera-image">
          {/* Clickable camera icon to trigger file input */}
          <div className="camera-icon-box" id='image' onClick={handleClick}>
            <Camera size={32} />
          </div>

          {/* Hidden file input */}
          <input 
            type="file" 
            name="image" 
            id="upload" 
            ref={fileInputRef} 
            style={{ display: 'none' }} // Hide the input field
          />
          <p>Upload Photo</p>
        </div>

        <div className="member-form-box">
        <div className='input-field'>
            <span >First Name</span>
            <input type="text"   placeholder='Enter your first name'/>
        </div>
        <div className='input-field'>
            <span >Last Name</span>
            <input type="text"   placeholder='Enter your last name'/>
        </div>
      </div>

      <div className="member-form-box">
        <div className='input-field'>
            <span >Your email</span>
            <input type="text"   placeholder='Enter your email'/>
        </div>
        <div className='input-field'>
            <span > Phone Number</span>
            <input type="tel" pattern="[0-9]{10}"  maxlength="10" inputmode="numeric"  placeholder='Enter your phone number'/>
        </div>
      </div>

      <div className="member-form-box">
        <div className='input-field'>
            <span >Position</span>
            <input type="text"   placeholder='CEO'/>
        </div>
        <div className='input-field'>
            <span>Gender</span>
        <select className="input-field2">
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
          </select>
        </div>
      </div>


  <div className="member-button-box">
    <button>Add Now</button>
  </div>

      </div>

      
    </div>
  );
};

export default TeamAdd;
