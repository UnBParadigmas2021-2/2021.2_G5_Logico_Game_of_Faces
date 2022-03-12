import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import InfoPage from './pages/InfoPage';

ReactDOM.render(
  <React.StrictMode>
    <InfoPage 
      buttonLabel='Iniciar'
      title='Game of Faces'
      onClick={() => {}}
    />
  </React.StrictMode>,
  document.getElementById('root')
);

