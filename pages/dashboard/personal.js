import { useEffect, useRef, useState } from "react"
import { unAuth } from "../../middleware/authorization"
import NavDashboard from "../../components/NavDashboard"

export async function getServerSideProps(ctx) {
    await unAuth(ctx)
    
    const data = await fetch('http://localhost:3000/api/get/getPersonal');
    const dataPersonal = await data.json();

    return {
        props: {
            dataPersonal
        }
    }
}

export default function Personal({ dataPersonal }) {
    
    const inFullName = useRef(null);
    const inDesc = useRef(null);
    const inShortDesc = useRef(null);

    const [fields, setFields] = useState({
        name: '',
        descpersonal: '',
        desc_short: '',
        id: 0
    });

    const [status, setStatus] = useState('');

    useEffect(() => {
        contentHandler(dataPersonal);
        console.log('re-render');
    }, []);

    async function inputData(e) {
        e.preventDefault();
        const inputData = await fetch('/api/posts/postPersonal', {
            method: 'POST',
            body: JSON.stringify(fields),
            headers: { 'Content-Type': 'application/json' }
        })

        if (!inputData.ok) return setStatus('error');

        const feedBackInput = await inputData.json();
        console.log(feedBackInput);
        setStatus('success');
        location.reload();
    }

    async function updataData(id, e) {
        e.preventDefault();
        
        const updateData = await fetch(`/api/posts/update/${id}`, {
            method: 'PUT',
            body: JSON.stringify(fields),
            headers: {'Content-Type': 'application/json'}
        })

        const feedBackUpdate= await updateData.json();
        console.log(feedBackUpdate);
        setStatus('updated');
    }
    
    async function deleteData(id, e) {
        e.preventDefault();
        
        console.log(id);
        if (confirm('Yakin hapus data ?')) {
            const deleteData = await fetch(`/api/posts/delete/${id}`, {
                method: 'DELETE',
            })
            const feedBackDelete = await deleteData.json();
            console.log(feedBackDelete);
            setStatus('deleted')

            location.reload();
        }
    }

    function fieldsHandler(e) {
        e.preventDefault();

        const attrib = e.target.getAttribute('name')
        console.log(e.target.value);

        setFields({
            ...fields,
            [attrib]: e.target.value
        })
    }

    function contentHandler({ data }) {
        if (data.length !== 0) {
            setFields(data[0])
        }
        setStatus('');

        console.log('contentHandler');
    }

    return (
        <div className="container-input">
            {(status === 'error') && alert('Data tidak berhasil input')}
            {(status === 'success') && alert('Data Berhasil di input')}
            {(status === 'updated') && alert('Data Berhasil di update')}
            {(status === 'delete') && alert('Data Berhasil di delete')}
            
            <NavDashboard personal='active' />

            <div className="content-input">
                <form onSubmit={
                    (dataPersonal.data.length === 0)? 
                        inputData.bind(this) : updataData.bind(this, fields.id)
                    }>
                    <label form="name">Full Name</label>
                    <input onChange={fieldsHandler.bind(this)} type="text"
                        name="name" placeholder="full name" autoComplete="off"
                        value={fields.name}/>
                    
                    <label form="descLong">Description</label>
                    <textarea onChange={fieldsHandler.bind(this)} type="text" 
                        name="descpersonal" placeholder="description" autoComplete="off"  
                        value={fields.descpersonal}/>
                    
                    <label form="descShort">Short Description</label>
                    <input onChange={fieldsHandler.bind(this)} type="text" 
                        name="desc_short" placeholder="short description" 
                        autoComplete="off"
                        value={fields.desc_short}/>
                    
                    <span style={{display: 'flex', justifyContent: 'space-between'}}>
                        <button type="submit">
                            {(dataPersonal.data.length === 0)? 'Submit' : 'Edit'}
                        </button>
                        {
                            dataPersonal.data[0] && (
                                <button type="reset" 
                                    onClick={deleteData.bind(this, fields.id)}>
                                        Delete
                                </button>
                            )
                        }
                    </span>
                </form>
            </div>
        </div>
    )
}