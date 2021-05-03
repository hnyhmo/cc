import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
// import reportWebVitals from './reportWebVitals';


const axios = require('axios');
// CHNAGE API ENDPOINT
const api = {
  url: 'http://cc.local/api/'
}

class Items extends React.Component {

  render() {

    if(this.props.obj){
      let items = Object.keys(this.props.obj).map((i, k) => {
        let show_child = this.props.obj[k].show_child;
        return <li key={this.props.obj[k].id}>
                  <label>
                    <input type="checkbox" 
                      checked={show_child}
                      onChange={() => {this.props.onShowChange(this.props.obj[k].id)}}
                    />                      
                    <span onClick={() => {this.props.onShowChange(this.props.obj[k].id)}}>
                      {this.props.obj[k].title} ({this.props.obj[k].child.length})
                    </span>           
                    {(this.props.obj[k].child.length > 0)?      
                      <span onClick={() => {this.props.onShowChange(this.props.obj[k].id, true)}} className='showAll'>
                        {(show_child)?'hide all':'show all'}
                      </span>
                      :''}
                  </label>
                  <Items cls={(show_child)?'':'dnone'} obj={this.props.obj[k].child} onShowChange={this.props.onShowChange} />
                </li>
      }
      );
      let key = Math.random().toString(36).substr(2, 9)
      return <ul key={key} className={this.props.cls}>{items}</ul>;
    }else{
      return null;
    }
  }
}









class Parent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      obj: {}
    }
  }


  componentDidMount() {
    let currentComponent = this;
    let token = localStorage.getItem('user');

    // CHECK TOKKEN
    if(!token){
      var bodyFormData = new FormData();
      bodyFormData.append('user', 'guest');
      axios.post(api.url+'request', bodyFormData)
      .then(function(r) {
        localStorage.setItem('user', r.data.token)
      })
      .catch(function (error) {
        alert('Restricted Access')
      });
    }
    // GET CATEGORY

    if(localStorage.getItem('user')){
      axios.defaults.headers.common['Authorization'] = localStorage.getItem('user');
      axios.get(api.url+'category').then(function (r) {
        r = r.data
        if(r.status){
          currentComponent.setState({obj: r.data})
        }
      })
      .catch(function (error) {
        console.log(error);
      });
    }else{
      alert('Restricted Access')
    }


  }
  
  mapData(key, obj, all){
    var data = [];
    for(let i=0;i<=obj.length; i++){
      if(obj[i]){
        var new_all = false;
        if(key == obj[i].id){
          obj[i].show_child = !obj[i].show_child;

          if(new_all){
            new_all = all;
          }
        }
        obj[i].child = this.mapData(key, obj[i].child, new_all)
        data.push(obj[i]);
      }
    }
    return data;
  }


  onShowChange(key, all) {
    var data = this.mapData(key, this.state.obj, all);
    this.setState({obj: data})
  }


  render() {
    return (
      <div>
        <h1>Facet</h1>
        <Items  obj={this.state.obj} onShowChange={this.onShowChange.bind(this)}/>
      </div>
    );
  }
}


ReactDOM.render(
  <React.StrictMode>
    <Parent />
  </React.StrictMode>,
  document.getElementById('root')
);

