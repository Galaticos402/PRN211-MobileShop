import * as React from 'react';
import { Route, Switch } from 'react-router';
import Home from './components/HomeComponent'

import './custom.css'

export default () => (
    <div>
        <Switch>
            <Route exact path='/' component={Home} />
            <Route path='/counter' component={Home} />
            <Route path='/fetch-data/:startDateIndex?' component={Home} />
        </Switch>
    </div>
    
);
