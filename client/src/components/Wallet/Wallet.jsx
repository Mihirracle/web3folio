// import { useState } from "react";
// import ABI from "./ABI.json";
// import Web3 from "web3";
// import './Wallet.css';
// import PropTypes from 'prop-types';

// const Wallet = ({ saveState }) => {
//   const [connected, setConnected] = useState(true);
//   const isAndroid = /android/i.test(navigator.userAgent);

//   const init = async () => {
//     try {
//       const web3 = new Web3(window.ethereum);
//       await window.ethereum.request({ method: 'eth_requestAccounts' });
//       const contract = new web3.eth.Contract(
//         ABI,
//         "0xDB3bC2db77A1AD99A478283eC4aaFA48e6b62Ab8"
//       );
//       setConnected(false);
//       saveState({ web3: web3, contract: contract });
//     } catch (error) {
//       alert("Please Install Metamask");
//     }
//   }

//   return (
//     <>
//       <div className="header">
//         {isAndroid && <button className="connectBTN">
//           <a href="https://metamask.app.link/dapp/mihiroar.netlify.app/">Click For Mobile</a>
//         </button>}
//         <button className="connectBTN" onClick={init} disabled={!connected}>
//           {connected ? "Connect Metamask" : "Connected"}
//         </button>
//       </div>
//     </>
//   )
// }

// // Prop type validation
// Wallet.propTypes = {
//   saveState: PropTypes.func.isRequired, // 'saveState' is a required function
// };

// export default Wallet;

import {useState} from "react";
import ABI from "./ABI.json";
import Web3 from "web3";
import './Wallet.css';

const Wallet =({saveState})=>{
      const [connected,setConnected]=useState(true);
      const isAndroid = /android/i.test(navigator.userAgent);
      const init =async()=>{
      try{
        const web3 = new Web3(window.ethereum);
        await window.ethereum.request({method:'eth_requestAccounts'});
        const contract = new web3.eth.Contract(
            ABI,
            "0x080664B7F6F18b5Df9D54816be8C4eFB1fe057A3"
        );
         setConnected(false);
         saveState({web3:web3,contract:contract});
      }catch(error){
        alert("Please Install Metamask");
      }
        
      }
      return<>
      <div className="header">
      {isAndroid  && <button className="connectBTN">
         <a href="https://metamask.app.link/dapp/mihiroar.netlify.app/">Click For Mobile</a>
        </button>  } 
       <button className="connectBTN" onClick={init} disabled={!connected}> {connected? "Connect Metamask":"Connected"}</button>
      </div>
      </>
}
export default Wallet;
