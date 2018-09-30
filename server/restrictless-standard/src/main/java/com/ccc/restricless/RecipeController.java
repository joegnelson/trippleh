package com.ccc.restricless;

import java.io.IOException;
import java.util.LinkedHashSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "recipe", urlPatterns = { "/recipe" })
public class RecipeController extends HttpServlet {

	static LinkedHashSet<Recipe> global_recipes = new LinkedHashSet<Recipe>();
	static {
		
		//	id	title	imageName	imageUrl	category	restrictions	ingredients	directions																
		Recipe GlutenFreeBananaPeachWalnutPancakes = new Recipe	("1"	,"Gluten Free Banana Peach Walnut Pancakes"	,"GlutenFreeBananaPeachWalnutPancakes"	,"https://ccc-restrictless-login-t1.appspot.com/GlutenFreeBananaPeachWalnutPancakes1.JPG"	,"Breakfast"	,"Gluten Free, Dairy Free, Vegetarian"	,"1 mashed banana, 2 eggs, 1 teaspoon baking powder, 1/2 teaspoon cinnamon, 1/2 Chopped walnuts, A pinch of salt, 1 peach, water", "1. Mash the banana, 2. Combine the eggs with the banana until a homologous mixture, 3. Add in the baking powder, cinnamon and salt and mix to combine, 4. Cut a peach into small cubes and add to a saucepan with a little bit of water, 5. Once tender, remove and set aside, 6. Heat a non stick griddle to medium heat, 7. Scoop batter onto griddle and add cooked peaches and walnuts to the middle of the pancakes, 8. Flip once golden brown on one side and remove once fully cooked"); 														
		Recipe VeganPretzels = new Recipe	("2"	,"Vegan Pretzels"	,"VeganPretzels"	,"https://ccc-restrictless-login-t1.appspot.com/VeganPretzels.jpg"	,"Doughs"	,"Dairy Free, Nut Free, Vegetarian, Vegan"	,"4 teaspoons active dry yeast,1 teaspoon white sugar,1 1/4 cups warm water (110 degrees F),5 cups all purpose flour,1 1/2 teaspoon salt,1 tablespoon vegetable oil,1/2 cup baking soda,4 cups hot water,Coarse sea salt (for finising)", "1. In a small bowl, dissolve yeast and 1 teaspoon sugar in 1 1/4 cup warm water. Let stand until creamy, about 10 minutes, 2. In a large bowl, mix together flour, 1/2 cup sugar, and salt. Make a well in the center; add the oil and yeast mixture. Mix and form into a dough. If the mixture is dry, add one or two more tablespoons of water. Knead the dough until smooth, about 7 to 8 minutes, 3. Lightly oil a large bowl, place the dough in the bowl, and turn to coat with oil. Cover with plastic wrap and let rise in a warm place until doubled in size, about 1 hour, 4. Preheat oven to 450 degrees F (230 degrees C). Grease 2 baking sheets, 5. In a large bowl, dissolve baking soda in 4 cups hot water; set aside. When risen, turn dough out onto a lightly floured surface and divide into 12 equal pieces. Roll each piece into a rope and twist into a pretzel shape. Once all of the dough is shaped, dip each pretzel into the baking soda-hot water solution and place pretzels on baking sheets. Sprinkle with kosher salt, 6. Bake in preheated oven until browned, about 8 minutes." );															
		Recipe VeganRoastedBrusselSprouts = new Recipe	("3"	,"Vegan Roasted Brussel Sprouts"	,"VeganRoastedBrusselSprouts"	,"https://ccc-restrictless-login-t1.appspot.com/VeganRoastedBrusselSprouts.jpg"	,"Sides"	,"Sugar Free, Gluten Free, Dairy Free, Nut Free, Vegetarian, Vegan"	,"Brussel Sprouts, olive oil, salt and pepper to taste, cast iron skillet"	,"1. Preheat an oven to 375 degrees farenheit, 2. Rinse and cut the brussel sprouts in half length-wise, 3. Toss them with oil, salt and pepper in the cast iron skillet, 4. Put the skillet in the oven and toss every so often, 5. Cook until golden brown and fork tender "	);															
		Recipe CookieDoughMacarons = new Recipe	("4"	,"Cookie Dough Macarons"	,"CookieDoughMacarons"	,"https://ccc-restrictless-login-t1.appspot.com/CookieDoughMacarons.png"	,"Batters"	,"Batters"	,""	,""	);															
		Recipe DFPumpkinRavioli = new Recipe	("5"	,"Dairy Free Pumpkin Ravioli"	,"DFPumpkinRavioli"	,"https://ccc-restrictless-login-t1.appspot.com/DFPumpkinRavioli.jpg"	,"Lunch/Dinner"	,"Lunch/Dinner"	,""	,""	);															
		Recipe VeganPretzelMonkeyBites = new Recipe	("6"	,"Vegan Pretzel Monkey Bites"	,"VeganPretzelMonkeyBites"	,"https://ccc-restrictless-login-t1.appspot.com/VeganPretzelMonkeyBites.jpg"	,"Doughs"	,"Doughs"	,""	,""	);															
		Recipe VeganKalePesto = new Recipe	("7"	,"Vegan Kale Pesto"	,"VeganKalePesto"	,"https://ccc-restrictless-login-t1.appspot.com/VeganKalePesto.jpg"	,"Dips"	,"Dips"	,"2 to 3 cloves garlic, 3 cups packed kale (about 1 small bunch), ¾ cup hemp seeds or toasted walnuts or pecans, 2 tablespoons lemon juice (about 1 lemon), ¾ teaspoon fine-grain sea salt, ¼ teaspoon ground pepper, Red pepper flakes, optional (if you want to add some kick), ¼ cup flaxseed oil or extra-virgin olive oil (more if desired)", "1. In a food processor, add the peeled garlic cloves and process until the garlic is minced, 2. Add the kale, hemp seeds, lemon juice, salt and pepper, 3. Turn on the food processor and drizzle in the oil, 4. Process until the pesto reaches your desired consistency, stopping to scrape down the sides as necessary, 5. Taste and add more lemon, salt or pepper if necessary"	);															
		Recipe PeachHandPies = new Recipe	("8"	,"Peach Hand Pies"	,"PeachHandPies"	,"https://ccc-restrictless-login-t1.appspot.com/PeachHandPies.JPG"	,"Pie"	,"Pie"	,"Dough: 2 cups all purpose flour, 1/2 teaspoon salt, 2/3 cupe coconut oil (solid, liquid), 3- 6 tablespoons ice cold water, Filling: 2 peaches, 1/2 teaspoon "	,"Dough: 1. Add flour and salt to a large mixing bowl and whisk to combine, 2. Add coconut oil in spoonfuls and use a pastry cutter or fork to cut the two together, until it resembles wet sand - about 30-45 seconds, 3. Add ice cold water 1 Tbsp at a time and use a wooden spoon to gently mix. Add only as much water as needed to help it come together and form a dough - about 3-4 Tbsp, 4. Gently knead/form the dough in the bowl and gather any loose scraps. Then transfer directly to a well-floured surface and form into a disc with your hands, 7. Lightly flour the top of the dough, as well as a rolling pin, and gently roll into a circle the shape of your pie pan, about 1/8-inch thick. Add more flour as needed to prevent sticking. It’s fairly forgiving, so if it cracks, just patch it up with slightly wet fingers and reform."	);															
		Recipe VeganSweetPotato = new Recipe	("9"	,"Vegan Sweet Potato Pasta"	,"SweetPotatoPasta"	,"https://ccc-restrictless-login-t1.appspot.com/SweetPotatoPastaSmall.jpg"	,"Lunch/Dinner"	,"Lunch/Dinner"	,"2 sweet potatos spiralized, 2 cloves of garlic, olive oil, salt and pepper to taste "	,"1. Heat oil in a sauce pan on medium-high heat, 2. Add garlic, salt and pepper and cook for 30 seconds, 4. Toss the sweet potato noodles with the garlic oil and cook until noodles are cooked all the way through "	);															
		
		
		global_recipes.add(GlutenFreeBananaPeachWalnutPancakes);
		global_recipes.add(VeganPretzels);
		global_recipes.add(VeganRoastedBrusselSprouts);
		global_recipes.add(CookieDoughMacarons);
		global_recipes.add(DFPumpkinRavioli);
		global_recipes.add(VeganPretzelMonkeyBites);
		global_recipes.add(VeganKalePesto);
		global_recipes.add(PeachHandPies);
		global_recipes.add(VeganSweetPotato);
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		//returning the response
		resp.setContentType("application/json");
		StringBuffer sb = new StringBuffer();
		sb.append("{\"recipes\": [");
		boolean afterONE=false;
		for (Recipe recipe : global_recipes) {
			if(afterONE)sb.append(",");
			sb.append(recipe.toJson());
			afterONE=true;
		}
		sb.append("]}");

		resp.getWriter().println(
				sb.toString()
				);
		resp.setStatus(200);
	}

}