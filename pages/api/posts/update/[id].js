import db from '../../../../libs/db'

export default async function updateHandler(req, res) {
    if (req.method !== 'PUT') return res.status(405).end();

    const { id } = req.query;
    const { name, descpersonal, desc_short } = req.body;

    await db('personal_data').where({ id }).update({ name, descpersonal, desc_short })
    const resultUpdate = await db('personal_data').where({ id }).first()

    res.status(200);
    res.json({
        message: 'UPDATE DATA',
        data: resultUpdate
    })
}