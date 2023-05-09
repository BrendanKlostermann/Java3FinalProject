# PokemonQuiz
## Alex Korte, Brendan Klostermann

This is the pokemon quiz application. You can test your knowledge against a preset list of
questions or you can submit your own questions for users to answer.

### Signing in
If you are not already a registered user you can create an account by selecting
the Log in Button on the left and selecting <u>Register An Account </u>.
<br>
If you already have an account you can go ahead and sign in from here.

### Taking a Quiz
On the left side of the screen you will have an of three different types of quizzes
we offer.
* picture Quiz - This quiz will show you a pokemon and ask you which one it is.
* Type Quiz - This quiz will give you a pokemon type and give you a list of pokemon to choose from
* User made Questions - This quiz is made of us questions designed by other users 
like yourself. You never know what kind of question you will see in here.

### Pokedex
Thie pokedex allows you to study all 721 currently available pokemon.
Here you can will find all of their names, pokemon number, and their elemental types
as well as a picture of them. This may not help you with user created questions, 
but for the type quiz and picture quiz this is all you need to study.

### Getting Admin Support
If you have issues with anything on this site you are able to contact the administrators
by sending in a help ticket. To do so simply select the [Get Help] option on the left. 
There will be a brief form asking what the issue is and a contact email for admins to reach out
to you if they need.


### Admin Access
If you are signing in as an admin go through the normal sign in process as any other user.
From there you can select the [Get Help] button and select the option to view 
current help requests. From there you can select to either put it in a working
status or you can mark is as completed.



Deployment command:
`$ az webapp deploy --resource-group pokemon-quiz --name java3-pokemonquiz --src-path ./target/pokemonQuiz-1.0-SNAPSHOT.war --type war`