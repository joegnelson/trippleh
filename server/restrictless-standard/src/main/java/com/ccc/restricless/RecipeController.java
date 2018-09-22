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
		Recipe GlutenFreeBananaPeachWalnutPancakes = new Recipe	("1"	,"Gluten Free Banana Peach Walnut Pancakes"	,"GlutenFreeBananaPeachWalnutPancakes"	,"https://ccc-restrictless-login-t1.appspot.com/beetLasanga.png"	,"Breakfast"	,"Gluten Free, Dairy Free, Vegetarian"	,"1 mashed banana,2 eggs,1 teaspoon baking powder,1/2 teaspoon cinnamon,1/2 Chopped walnuts,A pinch of salt"	,""	);															
		Recipe VeganPretzels = new Recipe	("2"	,"Vegan Pretzels"	,"VeganPretzels"	,"https://ccc-restrictless-login-t1.appspot.com/beetLasanga.png"	,"Doughs"	,"Dairy Free, Nut Free, Vegetarian, Vegan"	,"4 teaspoons active dry yeast,1 teaspoon white sugar,1 1/4 cups warm water (110 degrees F),5 cups all purpose flour,1 1/2 teaspoon salt,1 tablespoon vegetable oil,1/2 cup baking soda,4 cups hot water,Coarse sea salt (for finising)"	,""	);															
		Recipe VeganRoastedBrusselSprouts = new Recipe	("3"	,"Vegan Roasted Brussel Sprouts"	,"VeganRoastedBrusselSprouts"	,"https://ccc-restrictless-login-t1.appspot.com/beetLasanga.png"	,"Sides"	,"Sugar Free, Gluten Free, Dairy Free, Nut Free, Vegetarian, Vegan"	,""	,""	);															
		Recipe CookieDoughMacarons = new Recipe	("4"	,"Cookie Dough Macarons"	,"CookieDoughMacarons"	,"https://ccc-restrictless-login-t1.appspot.com/beetLasanga.png"	,"Batters"	,"Batters"	,""	,""	);															
		Recipe DFPumpkinRavioli = new Recipe	("5"	,"Dairy Free Pumpkin Ravioli"	,"DFPumpkinRavioli"	,"https://ccc-restrictless-login-t1.appspot.com/beetLasanga.png"	,"Lunch/Dinner"	,"Lunch/Dinner"	,""	,""	);															
		Recipe VeganPretzelMonkeyBread = new Recipe	("6"	,"Vegan Pretzel Monkey Bread Bites"	,"VeganPretzelMonkeyBites"	,"https://ccc-restrictless-login-t1.appspot.com/beetLasanga.png"	,"Doughs"	,"Doughs"	,""	,""	);															
		Recipe VeganKalePesto = new Recipe	("7"	,"Vegan Kale Pesto"	,"VeganKalePesto"	,"https://ccc-restrictless-login-t1.appspot.com/beetLasanga.png"	,"Dips"	,"Dips"	,""	,""	);															
		Recipe VeganPeach = new Recipe	("8"	,"Vegan Peach Hand Pies"	,"PeachHandPies"	,"https://ccc-restrictless-login-t1.appspot.com/beetLasanga.png"	,"Pie"	,"Pie"	,""	,""	);															
		Recipe VeganSweetPotato = new Recipe	("9"	,"Vegan Sweet Potato Pasta"	,"SweetPotatoPasta"	,"https://ccc-restrictless-login-t1.appspot.com/beetLasanga.png"	,"Lunch/Dinner"	,"Lunch/Dinner"	,""	,""	);															
		
		
		
		global_recipes.add(GlutenFreeBananaPeachWalnutPancakes);
		global_recipes.add(VeganPretzels);
		global_recipes.add(VeganRoastedBrusselSprouts);
		global_recipes.add(CookieDoughMacarons);
		global_recipes.add(DFPumpkinRavioli);
		global_recipes.add(VeganPretzelMonkeyBread);
		global_recipes.add(VeganKalePesto);
		global_recipes.add(VeganPeach);
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