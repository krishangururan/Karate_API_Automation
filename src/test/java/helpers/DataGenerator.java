package helpers;

import com.github.javafaker.Faker;
import net.minidev.json.JSONObject;

public class DataGenerator {

    public static String getRandomEmail(){
        Faker faker = new Faker();
        return faker.name().firstName().toLowerCase()+faker.random().nextInt(0,100)+"@test.com";
    }

    public static String getRandomUsername(){
        return new Faker().name().username();
    }

    public String getNonStaticUsernameMethodData(){
        return new Faker().name().username();
    }
    

    public static JSONObject getRandomArticleValues(){
        Faker faker=new Faker();
        String title=faker.gameOfThrones().character();
        String description=faker.gameOfThrones().city();
        String body=faker.gameOfThrones().quote();
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("title", title);
        jsonObject.put("body", body);
        jsonObject.put("description", description);
        return jsonObject;
    }
}
