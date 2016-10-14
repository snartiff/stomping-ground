import React from 'react';

const District = props => {
  let path = `districts/${props.id}`;
  let image = props.picture;
  return (
    <li key={props.id} className="neighborhood">
      <a href={path}><img src={image} className="district-pic"/></a><br />
      <a href={path} className="title">{props.name}</a>
    </li>
  );
}

export default District;
