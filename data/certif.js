const certif = [
    {
        name: 'Alibaba - Landing AI Developer Learning Series 1',
        tag: ['#AI', '#machine-learning', '#python'],
        foto: ['https://i.solidfiles.com/m2AQ4dq4ZRKRy.jpeg'],
        date: 'valid to: Monday, 13 October 2023',
        pdf: 'http://s02.solidfilesusercontent.com/ZGYzMjI1NjgzMjExOTNmZjU3Y2JiYWFmMWQ5OTRjY2UwZTA3NTk2NToxblJPZEc6RXpJUlUyeGtsMVVNeFczcDRFUFNNd3pPTXhJ/5dBwWz22KmDvg/Alibaba_-_Landing_AI_Developer_Learning_Series_1.pdf'
    },
    {
        name: 'TOEFL - Prediction Test',
        tag: ['#language-test', '#english-test'],
        foto: ['https://i.solidfiles.com/XLQjwZyrrD3md.png'],
        date: 'Tuesday, 21 Desember 2021',
        pdf: 'http://s02.solidfilesusercontent.com/YzE2NjQ1MGEwZjY3YTk0MTNmMDE3ZjFiOWMwOWIyMTM1NzRlZDJiODoxblJPZG46OXVwQWxGcmY4NzlVQkdIUzdTa3lVMC1wYVY0/Rxv533Kv4Mg78/TOEFL_-_Dhino_Rahmad_Kusuma.pdf'
    },
    {
        name: 'Belajar Membuat Front-End Web',
        tag: ['#HTML', '#CSS', '#flexbox', '#web-storage', '#javascript-DOM'],
        foto: ['https://i.solidfiles.com/VKmezqV4wdQxy.png', 'https://i.solidfiles.com/MWRANqapx82LL.png'],
        date: 'Friday, 16 July 2021',
        pdf: 'http://s01.solidfilesusercontent.com/ZTcwNzY3OGRlOTc3MWFjYTJlMTkwODU2YmYwZjE5YWU2MmRhNzY5YjoxblJPZUc6cjdSNzFTQWFwclBNdlJjaXFWdFhlR2NvbWE4/y6x8jGeprB73w/Belajar_Membuat_Front-end_Web.pdf'
    },
    {
        name: 'Belajar Pemrograman Dasar Web',
        tag: ['#HTML', '#CSS', '#flexbox', '#web-storage', '#javascript'],
        foto: ['https://i.solidfiles.com/xVgeApGVrkQy8.png', 'https://i.solidfiles.com/2dq8gMP2nd8Z4.png', 'https://i.solidfiles.com/xVgmv7B2kVRWx.png'],
        date: 'Monday, 05 July 2021',
        pdf: 'http://s02.solidfilesusercontent.com/MDAwMTQwNTRlMWY3Zjg5MGMxMjFlYzIwM2IyY2Y2YWJmYzM3NGYzODoxblJPZWo6b2NCZHdfT2MxOFVJNlBtSE1ualZTN2wzaDVn/VKRV28MdL4NAd/Belajar_Dasar_Pemrograman_Web.pdf'
    },
    {
        name: 'Architecting on AWS (Membangun Arsitektur Cloud di AWS)',
        tag: ['#aws', '#amazon-SNS', '#amazon-SQS','#IAM'],
        foto: ['https://i.solidfiles.com/g6akXkQ2wyVn4.png', 'https://i.solidfiles.com/VKmnPPkd3v5Mg.png', 'https://i.solidfiles.com/dNdR33DzP5z5w.png'],
        date: 'Wednesday, 02 Juni 2021',
        pdf: 'http://s01.solidfilesusercontent.com/Mjg5ODhlOGI0Yjc4NjJlYTQyNmMzNzEzZDVmOTU4MDYzMzdkMWQ0MDoxblJPZjU6TXdJeHcycXdsVE42Qi1RdjlQdVNxX3o2ajA4/AWQz2m3PBAZgg/Architecting_on_AWS_%28Membangun_Arsitektur_Cloud_di_AWS%29.pdf'
    },
    {
        name: 'Belajar Dasar Pemrograman JavaScript',
        tag: ['#jest', '#javascript', '#es6', '#oop', '#nodeJs'],
        foto: ['https://i.solidfiles.com/pdqQQ7km2qQ4v.png', 'https://i.solidfiles.com/YLNYmQ7v6pRRk.png', 'https://i.solidfiles.com/De5dDqGZ4Nr7Y.png'],
        date: 'Saturday, 10 April 2021',
        pdf: 'http://s01.solidfilesusercontent.com/ZDA3NzU3ODkxMmQwNGQxNGEwYzk3NDIzNTY0N2MxMGM2YzhiY2NkMzoxblJPZWc6MDJCTlAxeHVTVExMUmNGZWx6TVptZzVTeVVF/eWxMDwkqyY73k/Belajar_Dasar_Pemrograman_JavaScript.pdf'
    },
    {
        name: 'Cloud Practitioner Essentials (Belajar Dasar AWS Cloud)',
        tag: ['#AWS', '#cloud-computing'],
        foto: ['https://i.solidfiles.com/m2AQQ6D68rMKQ.png', 'https://i.solidfiles.com/De5dDAzDZVZja.png', 'https://i.solidfiles.com/De5dDqGZ4Nr7Y.png'],
        date: 'Monday, 22 March 2021',
        pdf: 'http://s01.solidfilesusercontent.com/OGQ4NjM3NzY2MzdhZTc5N2FjYjdiM2IxNzg3OGY1ZDU5YmU4OGYxZjoxblJPZmw6azZzUzBsYVlOazVJS1puSXVScnhIMHJvRlhv/78Ay6w64yYZnw/Cloud_Practitioner_Essentials_%28Belajar_Dasar_AWS_Cloud%29.pdf'
    },
    {
        name: 'Cisco - IT Essentials: PC Hardware and Software (PTI)',
        tag: ['#cisco', '#english-test'],
        foto: ['https://i.solidfiles.com/vN4VaQ5XGzm2m.png'],
        date: 'Tuesday,18 July 2020',
        pdf: 'http://s02.solidfilesusercontent.com/ZjljMDM4Y2IzNzI0OWNiNjdiMjU2YmU0YjhkYmE3MDZlM2U1NjhhMjoxblJPZ0Q6Mm5VX2I1dlR3QURKUkkwUVJKNjBXRmJMQlVz/6GR5VV5Pqea54/Cisco_-_DHINORAHMAD_KUSUMA-PTI_Pagi_A_2019-certificate_%281%29.pdf'
    },
    {
        name: 'Teknik Komputer dan Jaringan - LSP',
        tag: ['#mikrotik', '#networking', '#switch', '#LSP'],
        foto: ['https://i.solidfiles.com/MW5reMBmwrAwB.png', 'https://i.solidfiles.com/YLzApPjRXe6VX.png'],
        date: '17 June 2019',
        pdf: 'http://s02.solidfilesusercontent.com/ODAxNDFhYzI1N2U4ODZlZjE0N2U1NTI0YmU4ODMwYjFiM2U4Y2ZkMToxblJPZ3Q6OEI4QmcyOTFqcG8tWVlhRUw4bWJsd0hsRkk0/jQxqykyYw7N4D/LSP.pdf'
    },
    {
        name: 'PRAKERIN (PRAKTEK KERJA INDUSTRI)',
        tag: ['#mikrotik', '#networking'],
        foto: ['https://i.solidfiles.com/78AywrapWgBgz.png', 'https://i.solidfiles.com/2dvDmRL4j8dGz.png'],
        date: 'June 2018',
        pdf: 'http://s01.solidfilesusercontent.com/M2VmZWYwY2IzY2I2ZTA1OTQ2YTRkZjRmODFlYmM1ODhlZTU4NmI4NjoxblJPaDg6ZEJoTzkyc3NERjVVdEVOTGtSZkExbnA5cnNB/vNx8XBxAzZpxj/PKL.pdf'
    },
]

export default certif;