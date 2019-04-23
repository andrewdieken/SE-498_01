class Authenticate{
    constructor(){
        this.authenticated =false;
    }

    login(globalPass,userInput,cb){       
        if(globalPass===userInput){
            this.authenticated =true;
            cb();
        }else{
            alert("Incorrect password! Please try a new password or contact your campaign manager for the password.");
        }
     

    }
    logout(){
        this.authenticated=false;
    }
    isAuthenticated(){
        return this.authenticated;
    }


}

export default new Authenticate();