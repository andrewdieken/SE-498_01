class Authenticate{
    constructor(){
        this.authenticated =false;
    }

    login(globalPass,userInput,cb){
        if(globalPass===userInput){
            this.authenticated =true;
            cb();
        }else{
            return;
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