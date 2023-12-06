cats = [
        {
            name: 'Garfield',
            age: 40,
            enjoys: 'Eating Lasagna, kicking Odie off ledges',
            image: 'https://i.imgur.com/N3EKQ4Q.jpg'
        },
        {
            name: 'Tom',
            age: 50,
            enjoys: 'Chasing Jerry, crafting schemes',
            image: 'https://i.imgur.com/x20ALYq.jpg'
        },
        {
            name: 'Sylvester',
            age: 45,
            enjoys: 'Catching Tweetie, getting praised by Grandma',
            image: 'https://i.imgur.com/BLcxk7D.jpg'
        },
        {
            name: 'Felix',
            age: 55,
            enjoys: 'Pulling stuff out of his magic bag, going on adventures',
            image: 'https://i.imgur.com/2n0Vi8Q.png'
        },
        {
            name: 'Pink Panther',
            age: 53,
            enjoys: 'Solves mysteries, listens to jazz music',
            image: 'https://i.imgur.com/TbUNU3F.jpg'
        },
        {
            name: 'Hobbs',
            age: 41,
            enjoys: 'Get into mischief with Calvin',
            image: 'https://i.imgur.com/IXR0MdK.jpg'
        }



]


cats.each do |cat|
    Cat.create(cat)
    puts "creating cat #{cat}"
end
