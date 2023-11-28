import useInput from "../pages/hooks/useInput";
import Modal from "./Modal";

export default function ModalActivity({
    setOpenModal, addActivity, editActivity, activity
}) {
    const [title, handleTitleChange] = useInput(activity.title);
    const [description, handleDescriptionChange] = useInput(activity.description);
    const [techName, handleTechNameChange] = useInput(activity.tech_name);
    const [link, handleLinkChange] = useInput(activity.link);
    const [image, handleImageChange] = useInput(activity.image);

    function submitThread() {
        console.log(Object.keys(activity).length);
        if (Object.keys(activity).length == 0) {
            addActivity({title, tech_name: techName, link, description, image});
        } else {
            editActivity({id: activity.id, title, tech_name: techName, link, description, image})
        }
    }

    return (
        <>
            <Modal
                setOpenModal={setOpenModal}
                submitThread={submitThread}
            >
                <div className="title">
                    <h1>Bagaimana Aktifitas Belajar Kamu</h1>
                    <p>Silahkan isi aktifitas kamu agar orang lain juga tahu ?</p>
                    <textarea
                        cols="50"
                        rows="2"
                        placeholder="Isikan title aktifitas"
                        value={title}
                        onChange={handleTitleChange}
                    />
                </div>
                <div className="category">
                    <p>Technology Name / Bahasa Pemrogramman</p>
                    <textarea
                        cols="50"
                        rows="2"
                        placeholder="lebih dari 1 ? pisahkan dengan koma (,)"
                        value={techName}
                        onChange={handleTechNameChange}
                    />
                </div>
                <div className="category">
                    <p>Link Penyelenggara</p>
                    <textarea
                        cols="50"
                        rows="2"
                        placeholder="Isikan link penyelenggara program"
                        value={link}
                        onChange={handleLinkChange}
                    />
                </div>
                <div className="category">
                    <p>Link Image</p>
                    <textarea
                        cols="50"
                        rows="2"
                        placeholder="Isikan link image"
                        value={image}
                        onChange={handleImageChange}
                    />
                </div>
                <div className="body">
                    <p>Description</p>
                    <p>
                        <strong>{description.length}</strong>/320
                    </p>
                    <textarea
                        cols="60"
                        rows="8"
                        placeholder="apa yang kamu pikirkan ?"
                        value={description}
                        onChange={handleDescriptionChange}
                    />
                </div>
            </Modal>
        </>
    )
    
}