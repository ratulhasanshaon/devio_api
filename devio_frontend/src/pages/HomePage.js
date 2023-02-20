import React, {useEffect, useState} from 'react'
import {Link} from 'react-router-dom'
import axios from 'axios'


const HomePage = () => {

  const [users, setUsers] = useState([])
  const [total, setTotal] = useState(0)
  const [pagination, setPagination] = useState(null)

  useEffect(() => {
    getData()

  }, [])

  let getData = async (query = '') => {
    let response = await axios.get(`http://127.0.0.1:8000/users?query=${query}`)
    console.log('RESPONSE:', response)
    setUsers(response.data)
    setTotal(response.data.total)
    setPagination(response.data.pagination)
  }

  let searchData = (e) => {
    e.preventDefault()
    let query = e.target.query.value
    getData(query)
  }



  return (
    <div className='main--container'>
      <h2>Search  {total} Programmer found by @ratulhasan's webscraper</h2>
      <div className='form__wrapper'>
        <form onSubmit={searchData} id='search_form'>
          <input type="text" name="query" placeholder='Search User...'/>
          <input className='btn--primary' type="submit" value="Search" />
        </form>
      </div>
      <div className='user__list'>
        { users.map((user, index) =>(
          <div className='user__preview__wrapper' key={index}>
              <div className='user__preview__header'>
                  <Link to={`/user/${user.username}`}>
                      <img className='user__preview__image' src={user.profile_pic}/>
                  </Link>
                  <div>
                      <strong>{user.name}</strong>
                      <br/>
                      <a href={user.social_link} target="50">@{user.username}</a>
                  </div>
              </div>
              <small className='bio--preview'>{ user.bio}</small>
          </div>
        ))}
      </div>
    </div>
  )
}

export default HomePage