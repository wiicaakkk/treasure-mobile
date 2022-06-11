import React from 'react'
import PropTypes from 'prop-types'

const Input = ({ propps }) => {
  return (
    <input  
       {...propps}
    />
    
  )
}

Input.propTypes = {}

export default Input