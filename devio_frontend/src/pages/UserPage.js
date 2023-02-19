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
      {user &&(
        <div>
          <h1>{user.username}</h1>
          <h3>{user.bio}</h3>
        </div>
      )}
      
    </>
  )
}

export default UserPage