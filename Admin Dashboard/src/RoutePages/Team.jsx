import React from 'react'
import './Team.css'
import { useNavigate } from 'react-router-dom'



const Team = () => {

  const navigate = useNavigate()

  const MemberData =[
      {
        "name": "John Doe",
        "role": "Admin",
        "email": "john.doe@example.com",
        "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      },
      {
        "name": "Jasica",
        "role": "Project Manager",
        "email": "jane.smith@example.com",
         "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      },
      {
        "name": "Michael Johnson",
        "role": "UI/UX Designer",
        "email": "michael.johnson@example.com",
         "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      },
      {
        "name": "Emily Davis",
        "role": "Front-end Developer",
        "email": "emily.davis@example.com",
          "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      },
      {
        "name": "David Brown",
        "role": "Back-end Developer",
        "email": "david.brown@example.com",
         "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      },
      {
        "name": "Sophia Wilson",
        "role": "Data Analyst",
        "email": "sophia.wilson@example.com",
          "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      },
      {
        "name": "James Miller",
        "role": "DevOps Engineer",
        "email": "james.miller@example.com",
         "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      },
      {
        "name": "Olivia Martinez",
        "role": "Marketing Specialist",
        "email": "olivia.martinez@example.com",
          "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      },
      {
        "name": "William Anderson",
        "role": "Product Manager",
        "email": "william.anderson@example.com",
          "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      },
      {
        "name": "Ava Thomas",
        "role": "HR Manager",
        "email": "ava.thomas@example.com",
          "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      },
      {
        "name": "Benjamin White",
        "role": "QA Engineer",
        "email": "benjamin.white@example.com",
         "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      },
      {
        "name": "Charlotte Harris",
        "role": "Content Writer",
        "email": "charlotte.harris@example.com",
          "image": "https://files.oaiusercontent.com/file-7Snqq1d1upU9SQuPewLCzL?se=2025-02-21T04%3A40%3A49Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3Dcab2adf0-05a8-4b52-b38a-928c4a43d3a2.webp&sig=1zIy5zvTqtfL2/C3AEdCv2AqA5rjBD1fNZpUALRgfRk%3D"
      }
    ];
    
  

  return (
    <div className='main-box' >
       <div className='dashboard-top-bar'>
                <h1 className='dash-txt'>Team</h1>
                <button className='manage-member-btn' onClick={()=>navigate('/team-add')}>Add New Member</button>
            </div>

            <div className="team-main-container">

             {
                MemberData.map((e,index)=>{
                  return(
                    <div className="team-member-box" key={index}>
                    <div className="member-image-box">
                      <img src={e.image}/>
                    </div>
                    <div className="member-detail-box">
                      <h4>{e.name}</h4>
                      <p>{e.role}</p>
                      <p>{e.email}</p>
                    </div>
                  </div>
                  )
                })

             }
              

  </div>
    </div>
  )

}


export default Team