export default function Skill() {

    
    return (
        <div className="container-input">
            <div className="content-input">
                <center>
                    <h1 className="title">Dashboard</h1>
                    <button onClick={conditionHandler.bind(this, 'insert')}>Insert Data</button>
                    <button onClick={conditionHandler.bind(this, 'edit')}>Edit Data</button>
                    <button onClick={conditionHandler.bind(this, 'delete')}>Delete Data</button>
                </center> <br /> <br /> 
                <form onSubmit={inputData.bind(this)}>
                    <label form="name">Full Name</label>
                    <input onChange={fieldsHandler.bind(this)} type="text" name="name" placeholder="full name" />
                    
                    <label form="descLong">Description</label>
                    <input type="text" name="descLong" placeholder="description" />
                    
                    <label form="descShort">Short Description</label>
                    <input type="text" name="descShort" placeholder="short description" />
                    
                    <label form="title_position">Title Position</label>
                    <input type="text" name="titlePosition" placeholder="your title position" />
                    
                    <label form="name">Skill</label>
                    <input type="text" name="skill" placeholder="skill" />
                    
                    <label form="name">Tools</label>
                    <input type="text" name="tools" placeholder="tools" />
                    
                    <label form="name">Plan</label>
                    <input type="text" name="plan" placeholder="plan" />

                    <button type="submit">Submit</button>
                </form>
            </div>
        </div>
    )
}