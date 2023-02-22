import {BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import HomePage from './pages/HomePage'
import UserPage from './pages/UserPage'


import './App.css';

function App() {
  return (
    <Router>
       <Routes>
          <Route element={<HomePage/>} path= "" />
          <Route element={<UserPage/>} path= "/user/:username" /> 
       </Routes>
    </Router>
  );
}

export default App;
