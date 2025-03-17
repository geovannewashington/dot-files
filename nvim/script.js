class MathUtils {
    constructor() {
        console.log("hello from class"); 
        // -> this log is only going to be triggered if an instance of the class is created
    }
    
    // -> let's create our own custom sqrt method
    static sqrt(value) {
        return value ** (1/2);
    }
}
// -> adding a new comment
console.log(MathUtils.sqrt(25)); // -> Expected Output: 5
