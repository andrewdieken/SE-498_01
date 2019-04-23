import React from 'react';
import {Route, Redirect} from 'react-router-dom';
import authenticate from '../Classes/authenticate';

export const ProtectedRoute= ({component: Component, ...rest})=>{
    return(
        <Route {...rest} render={
            (props)=>{
                if(authenticate.isAuthenticated()){
                    return <Component {...props}/>

                }else{
                    return <Redirect to ={
                        {
                            pathname: "/login",
                            state:{
                                from:props.location
                            }
                        }
                    }/>
                }
            }
        }/>


    )
}