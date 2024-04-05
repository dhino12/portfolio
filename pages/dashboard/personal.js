import Image from "next/image";
import { useEffect, useState } from "react"
import { MdDeleteForever } from "react-icons/md";
import { FaRegEdit } from "react-icons/fa";
import bgProfile from "../../public/asset/webp/bg-repo.png"
import Dashboard from "../../layouts/Dashboard";
import supabase from "../../libs/supabaseClient";
import ModalActivity from "../../components/ModalActivity";
import { useRouter } from "next/router";

export default function Personal() {
    const [fields, setFields] = useState({
        name: '',
        descpersonal: '',
        desc_short: '',
        id: 0,
        birthday: '',
        title_archivement: '',
        organizer: '',
        created_at: ''
    });

    const [activity, setActivity] = useState([])
    const [editActivity, setEditActivity] = useState({}) // for edit modal
    const [status, setStatus] = useState('');
    const [isOpenModal, setOpenModal] = useState(false);

    useEffect(() => {
        const fetchUser = async () => {
            const { data, error } = await supabase
                .from("user_information")
                .select(`*, activity (*)`)
                .eq('id_user', sessionStorage.getItem("auth"))
                .single()

            if (data) {
                setFields({
                    name: data.name,
                    birthday: data.birthday,
                    descpersonal: data.about,
                    desc_short: data.short_about,
                    id: data.id_user,
                    organizer: data.organizer,
                    title_archivement: data.title_archivement,
                    created_at: data.created_at
                })
                setActivity(data.activity)
            }
        }
        fetchUser()
    }, []);

    async function inputData(e) {
        e.preventDefault();
        const { data, error } = await supabase
            .from("user_information")
            .insert({
                id_user: sessionStorage.getItem("auth"),
                name: fields.name,
                about: fields.descpersonal,
                short_about: fields.desc_short,
                birthday: fields.birthday,
            })
            .select()

        if (error) {
            console.error(error);
            alert("Failed Insert")
            return;
        }
        if (data) {
            alert("Success Insert")
            setFields({
                name: data[0].name,
                birthday: data[0].birthday,
                descpersonal: data[0].about,
                desc_short: data[0].short_about,
                id: data[0].id_user,
            })
        }
        // location.reload();
    }

    async function updataData(id, e) {
        e.preventDefault();
        const { data, error } = await supabase
            .from("user_information")
            .update({
                name: fields.name,
                about: fields.descpersonal,
                short_about: fields.desc_short,
                birthday: fields.birthday,
                title_archivement: fields.title_archivement,
                organizer: fields.organizer,
            })
            .eq("id_user", id)
            .select()
        
        if (error) {
            alert("Failed Update")
            return ;
        }
        if (data) {
            alert("Success Updated")
        }
    }
    
    async function deleteData(id, e) {
        e.preventDefault(); 
        if (!confirm('Yakin hapus data ?, hapus data ini akan termasuk menghapus aktifitas anda')) {
            return
        }

        const { data, error } = await supabase
            .from("user_information")
            .delete()
            .eq("id_user", id)
            .select()

        if (error) {
            console.error(error);
            alert("Oops something wrong")
        }
        if (data) {
            alert("Success Deleted")
            setEditActivity({})
            setActivity([])
            setFields({
                name: '',
                birthday: '',
                descpersonal: '',
                desc_short: '',
                id: 0,
                id_activity: null,
                id_experience: null,
            })
        }
    }

    function fieldsHandler(e) {
        e.preventDefault();
        const attrib = e.target.getAttribute('name')

        setFields({
            ...fields,
            [attrib]: e.target.value
        })
    }

    async function addActivity({ title, tech_name, link, description, image }) {
        const { data, error } = await supabase
            .from("activity")
            .insert({
                id_user: sessionStorage.getItem("auth"),
                title, description, tech_name,
                link, image,
            })
            .select()
        if (error) {
            console.error(error);
            return setStatus('error')
        } 
        if (data) { 
            setActivity((prevState) => [...prevState, {
                id: data[0].id,
                id_user: sessionStorage.getItem("auth"),
                title, description,
                tech_name, link,
            }])
            alert("Data Added")
            setOpenModal(false)
        
        }
    }

    async function editActivityHandler({
        id, title, tech_name, link, description, image
    }) {
        const { data, error } = await supabase
            .from("activity")
            .update({
                title, tech_name, link, description, image
            })
            .eq("id", id)
            .select()
        if (error) {
            console.error(error);
            alert("Failed update Activity")
        }
        if (data) {
            alert("Data Updated: " + title)
            setOpenModal(false)
            setActivity((prevState) => {
                return prevState.map(activityData => activityData.id == id ? data[0] : activityData)
            })
        }
    }

    async function deleteActivityHandler(id) {
        if (confirm('Yakin hapus data ?')) {
            const { data, error } = await supabase
                .from("activity")
                .delete()
                .eq("id", id)
                .select()

            if (error) {
                console.error(error);
                alert("Oops something wrong")
            }
            if (data) {
                alert("Success Deleted")
                setEditActivity({})
                setActivity((prevState) => {
                    return prevState.filter(activityData => activityData.id != id)
                })
            }
        }
    }
    
    return (
        <>
            <div className="dashboard-image-bg">
                <Image 
                    src={bgProfile}
                    height={450}
                />
            </div>
            {isOpenModal && (
                <ModalActivity
                    setOpenModal={setOpenModal}
                    addActivity={addActivity}
                    editActivity={editActivityHandler}
                    activity={editActivity}
                />
            )}
            <div className="container-content-input">
                <div className="info-user">
                    <h1>Dhino Rahmad Kusuma</h1>
                </div>
                <div className="content-input">
                    <form onSubmit={
                        (fields.id === 0)? 
                            inputData.bind(this) : updataData.bind(this, fields.id)
                        }>
                        <table>
                            <thead>
                                <tr key="1">
                                    <td><h3>User Information</h3></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr key="2">
                                    <td>
                                        <label form="name">Full Name</label>
                                        <input onChange={fieldsHandler.bind(this)} type="text"
                                            name="name" placeholder="full name" autoComplete="off"
                                            value={fields.name}/>        
                                    </td>
                                </tr>
                                <tr key="3">
                                    <td>
                                        <label form="descLong">Description</label>
                                        <textarea onChange={fieldsHandler.bind(this)} type="text" 
                                            name="descpersonal" placeholder="description" autoComplete="off"  
                                            value={fields.descpersonal}
                                            cols={25}/>
                                    </td>
                                </tr>
                                <tr key="4">
                                    <td>
                                        <label form="descShort">Short Description</label>
                                        <input onChange={fieldsHandler.bind(this)} type="text" 
                                            name="desc_short" placeholder="short description" 
                                            autoComplete="off"
                                            value={fields.desc_short}/>
                                    </td>
                                </tr>
                                <tr key="5">
                                    <td>
                                        <label form="birthday">Tempat / Tanggal Lahir</label>
                                        <input onChange={fieldsHandler.bind(this)} type="date" 
                                            name="birthday" placeholder="birthday" 
                                            autoComplete="off"
                                            value={fields.birthday}/>
                                    </td>
                                </tr>
                                <tr key="6">
                                    <td>
                                        <span>
                                            <button type="submit" style={{marginRight: 10}}>
                                                Submit
                                            </button>
                                            {
                                                fields.id && (
                                                    <button type="reset" 
                                                        onClick={deleteData.bind(this, fields.id)}>
                                                            Delete
                                                    </button>
                                                )
                                            }
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div className="container-activity">
                    <button className="button-add" onClick={() => {
                        setOpenModal(true)
                        setEditActivity({})
                    }}>Add Activity</button>
                    <div className="content-container">
                        {activity.map((activityData, index) => (
                            <article className="content-activity" key={index}>
                                <h3>{activityData.title}</h3>
                                <h5>{activityData.tech_name}</h5>
                                <p>{activityData.description}</p>
                                <button
                                    onClick={() => {
                                        deleteActivityHandler(activityData.id)
                                    }}
                                ><MdDeleteForever /></button>
                                <button onClick={() => {
                                    setOpenModal(true)
                                    setEditActivity(activityData)
                                }}><FaRegEdit /></button>
                            </article>
                        ))}
                    </div>
                </div>
            </div>
        </>
    )
}

Personal.layout = Dashboard