import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/le")
public class QueryController {	
	/*@RequestMapping("/query/{searchKey}")
	public Database.LearningElement[] find(@PathVariable String searchKey) {		
		return Database.get().find(searchKey);
	}*/
}
