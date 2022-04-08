import db from '../../../libs/db'

export default async function postPersonal(req, res) {
    if (req.method !== 'POST') return res.status(405).end();

    const {
        name, descpersonal, desc_short
    } = req.body;

    await db('personal_data').insert({ name, descpersonal, desc_short }); 
    
    const idPersonal = await db('personal_data').select('id');

    const getDataPersonal = await db('personal_data').where('id', idPersonal[idPersonal.length - 1].id).first();
    
    res.status(200);
    return res.json({
        message: 'Inserted Success',
        data: getDataPersonal
    })
}