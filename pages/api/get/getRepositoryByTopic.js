// ambil api berdasarkan topic'
    // Front-end web
    // android
    // back-end

import repoImg from "../../../data/repo";

export default async function getRepositoryByTopic(req, res) {
    if (req.method !== 'GET')  return res.status(405).end()

    try {
        // http://localhost:3000/api/get/getRepositoryByTopic?topic=front-end-web

        const { topic } = req.query;
        const response = await fetch('https://api.github.com/users/dhino12/repos?type=owner');
        const dataRepo = await response.json();
        if (dataRepo.message != undefined) throw dataRepo

        const dataFilteringWithTopics = dataRepo.filter((repo) => {
            if (repo.topics.includes(topic)) {
                repo['img'] = repoImg[`${repo.node_id}`]?.img ?? false
                repo['logo'] = repoImg[`${repo.node_id}`]?.logo ?? false
                return {...repo}
            }
        })

        res.status(200).json(dataFilteringWithTopics)
    } catch (error) {
        console.log(error);
        res.status(404).json({
            status: 'error',
            message: 'oops failed, something error'
        })
    }
}