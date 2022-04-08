export default function postSkill(req, res) {
    const {
        title_position, skill, tools, plan
    } = req.body;

    await db('skill').insert({ title_position, skill, tools, plan })
     
    const idSkill = await db('skill').select('id');

    const getDataSkill = await db('skill').where('id', idSkill[idSkill.length - 1].id).first();
    
    res.status(200);
    return res.json({
        message: 'Inserted Success',
        data: [
            getDataSkill
        ]
    })
}