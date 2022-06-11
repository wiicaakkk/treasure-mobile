import React from 'react'
import PropTypes from 'prop-types'

const Botton = ({ children, type = 'button', ...props }) => {
    return (
        <button
            className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
            type={type}
            {...props}>
            {children}
        </button>
    )
}

Botton.propTypes = {}

export default Botton
