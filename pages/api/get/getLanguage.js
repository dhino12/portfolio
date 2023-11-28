export default async function getLanguage (nameRepository) {
    try {
        const response = await fetch(`https://api.github.com/repos/Dhino12/${nameRepository}/languages`)
        const dataLanguage = await response.json();
        
        return dataLanguage
    } catch (error) {
        console.log(error);
    }
}