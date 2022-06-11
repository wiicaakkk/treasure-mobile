import React, { useState } from 'react'
import PropTypes from 'prop-types'
import { useFormik } from 'formik'
import * as Yup from 'yup'
import FormControl from '@/components/form/formControl'
import Input from '@/components/form/Input'
import Botton from '@/components/form/botton'
import axios from '@/lib/axios'

const Form = ({ handleAddPlace }) => {
    const placeSchema = Yup.object().shape({
        name: Yup.string()
            .min(4, 'Minimal4carachters')
            .max(254, 'Maximum 254 carachters')
            .required('Name is required'),
        description: Yup.string()
            .min(10, 'Minimal 10 carachters')
            .max(500, 'Maximum 300 carachters')
            .required('Description is required'),
    })

    const formik = useFormik({
        initialValues: {
            name: '',
            description: '',
            price: 0,
            image: '',
        },
        validationSchema: placeSchema,
        onSubmit: (values, { resetForm }) => {
            handleSubmit(values, resetForm)
        },
    })

    const handleSubmit = async (values, resetForm) => {
        try {
            const { data } = await axios.post(
                'http://localhost:8000/api/places',
                values,
            )
            handleAddPlace({
                place: data.data,
            })

            resetForm()
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <div className="w-full mb-3">
            <form onSubmit={formik.handleSubmit}>
                <FormControl label="name" id="name">
                    <input
                        className="shadow appearance-none border rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"
                        placeholder="Input tempat wisata"
                        id="name"
                        type="text"
                        name="name"
                        onChange={formik.handleChange}
                        value={formik.values.name}
                    />

                    {formik.errors && (
                        <label className="text-red-600">
                            {formik.errors['name']}
                        </label>
                    )}
                </FormControl>

                <FormControl label="description" id="description">
                    <input
                        className="shadow appearance-none border rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"
                        placeholder="Input description"
                        id="description"
                        type="text"
                        name="description"
                        onChange={formik.handleChange}
                        value={formik.values.description}
                    />

                    {formik.errors && (
                        <label className="text-red-600">
                            {formik.errors['description']}
                        </label>
                    )}
                </FormControl>

                <FormControl label="price" id="price">
                    <input
                        className="shadow appearance-none border rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"
                        placeholder="Input price"
                        id="price"
                        type="number"
                        name="price"
                        onChange={formik.handleChange}
                        value={formik.values.price}
                    />
                </FormControl>

                <FormControl label="image" id="image">
                    <input
                        className="shadow appearance-none border rounded w-full py-2 px-3 leading-tight focus:outline-none focus:shadow-outline"
                        placeholder="Input image"
                        id="image"
                        type="text"
                        name="image"
                        onChange={formik.handleChange}
                        value={formik.values.image}
                    />
                </FormControl>

                <Botton
                    type="submit"
                    disable={!(formik.isValid && formik.dirty)}>
                    Submit
                </Botton>
            </form>

            {/* <pre>{JSON.stringify(form, null, 2)}</pre> */}
        </div>
    )
}

Form.propTypes = {}

export default Form
