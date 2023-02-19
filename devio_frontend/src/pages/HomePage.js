import React, {useEffect, useState} from 'react'
import {Link} from 'react-router-dom'
import axios from 'axios'


const HomePage = () => {

  const [users, setUsers] = useState([])

  useEffect(() => {
    getData()

  }, [])

  let getData = async () => {
    let response = await axios.get('http://127.0.0.1:8000/users/')
    console.log('RESPONSE:', response)
    setUsers(response.data)
  }



  return (
    <div className='main--container'>
      <h2>Search Programmer  </h2>

      <div className='user__list'>
        { users.map((user, index) =>(
          <div className='user__preview__wrapper' key={index}>
             <Link to={`/user/${user.username}`}>
                <img className='user__preview__image' src={user.profile_pic}/>
             </Link>
              <strong>{user.username}</strong>
              <br/>
              <a href={user.social_link}>@{user.username}</a>
              <small>{user.bio}</small>
          </div>
        ))}
      </div>
    </div>
  )
}

export default HomePage