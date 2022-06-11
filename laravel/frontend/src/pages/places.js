import { useEffect, useState } from 'react'

import AppLayout from '@/components/Layouts/AppLayout'
import Head from 'next/head'
import axios from '@/lib/axios'
import PlaceForm from '@/components/place/form'

const PlacePage = () => {

    const [places, setPlaces] = useState([])
    const[loading, setLoading] = useState(false)
    const[error, setError] = useState(null)

    const fetchPlaces = async () => {
        try {
            setLoading(true)
            const { data } = await axios.get('http://localhost:8000/api/places')
            setPlaces(data.data)
        } catch (error) {
            setError(error.massage)
        }finally{
            setLoading(false) 
        }
    }

    useEffect(() => {
        fetchPlaces()
    }, [])
    
    const handleAddPlace = ({ place }) => {
        setPlaces( prev=> [...prev, place])
    }

    return <AppLayout
    header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
            Dashboard
        </h2>
    }>

    <Head>
        <title>Place</title>
    </Head>

    <div className="py-12">
        <div className="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div className="p-6 bg-white border-b border-gray-200">
                <PlaceForm handleAddPlace={handleAddPlace} />
                    {places.map(place => (
                       <p key={place.id}>{place.id} | {place.name}</p>
                    ))}
                </div>
            </div>
        </div>
    </div>
</AppLayout>
}
export default PlacePage