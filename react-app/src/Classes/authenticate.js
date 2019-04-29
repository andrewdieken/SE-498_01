class Authenticate{
    constructor(){
        this.authenticated =JSON.parse(localStorage.getItem("loggedIn"))||false;
        
    }

    login(globalPass,userInput,userName,cb){
        if(userName!==""){
            if(globalPass===userInput){
                this.authenticated =true;
                localStorage.setItem("loggedIn","true");
                cb();
            }else{
                alert("Incorrect password! Please try a new password or contact your campaign manager for the password.");
            }
        }else{
            alert("Please enter your name.")
        }       
        
     

    }
    logout(cb){
        this.authenticated=false;
        localStorage.removeItem("loggedIn");
        localStorage.removeItem("score");
        cb();
    }
    isAuthenticated(){
        return this.authenticated;
    }


}

export default new Authenticate();