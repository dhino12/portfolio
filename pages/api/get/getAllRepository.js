import repoImg from "../../../data/repo";

export default async function getAllRepository(req, res) {
    if (req.method !== 'GET') return res.status(405).end();

    async function getMyRepo() {
        try {
            const response = await fetch('https://api.github.com/users/dhino12/repos?type=owner');
            const dataRepository = await response.json();
            
            const dataFilteringWithTags = dataRepository.filter((repo, index) => {
                if (repo.topics.length != 0) {
                    repo['img'] = repoImg[`${repo.node_id}`]?.img ?? false
                    repo['logo'] = repoImg[`${repo.node_id}`]?.logo ?? false
                    return {...repo}
                }
            });
    
            return res.status(200).json({
                message: 'success',
                data: dataFilteringWithTags
            })
        } catch (error) {
            console.error(error);
            return res.status(404).json({
                ...error
            })
        }
    }

    return getMyRepo();

    // return res.json({data: 'null'})
}