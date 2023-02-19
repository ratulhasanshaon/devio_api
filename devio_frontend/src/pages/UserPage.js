import React, {useEffect, useState} from 'react'
import { useParams } from 'react-router-dom'
import axios from 'axios'

const UserPage = () => {
  const params = useParams()
  const username = params.username

  const [user, setUser] = useState(null)

  useEffect(() => {
    getData()

  }, [username])

  let getData = async () => {
    let response = await axios.get(`http://127.0.0.1:8000/users/${username}`)
    console.log('RESPONSE:', response)
    setUser(response.data)
  }


  return (
    <>
      {user && (
        <div className='user__preview__wrapper user_profile' >
              <img className='user__preview__image' src={user.profile_pic}/>
              <br/>
          <strong>{user.username}</strong>
          <br/>
          <a href={user.social_link}>@{user.username}</a>
          <br/>
          <small>{user.stack}</small>
          <br/>
          <small>{user.bio}</small>
        </div>
      )}
      
    </>
  )
}

export default UserPage