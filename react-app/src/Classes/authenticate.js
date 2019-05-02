class Authenticate{
    constructor(){
        this.authenticated =JSON.parse(localStorage.getItem("loggedIn"))||false;
        
    }

    login(globalPass,userInput,userName,cb,cb2){
        if(userName!==""){
            if(globalPass===userInput){
                this.authenticated =true;
                localStorage.setItem("loggedIn","true");
                cb();
                cb2();
            }else{
                alert("Incorrect password! Please try a new password or contact your campaign manager for the password.");
            }
        }else{
            alert("Please enter your name.")
        }       
        
     

    }
    logout(cb,cb2){
        this.authenticated=false;
        localStorage.removeItem("loggedIn");
        localStorage.removeItem("score");
        cb2();
        localStorage.removeItem("counter");
        cb();
        
    }
    isAuthenticated(){
        return this.authenticated;
    }


}

export default new Authenticate();