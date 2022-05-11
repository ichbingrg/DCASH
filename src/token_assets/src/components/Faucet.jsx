import React,{useState} from "react";
import { setTextRange } from "../../../../node_modules/typescript/lib/typescript";
import {token} from "../../../declarations/token";

function Faucet() {

  const [isDisabled, setDisable ] = useState(false); // to disable the faucet button while the transaction is happening
  const [buttonText, setButtonText] = useState("Gimme Gimme");

  async function handleClick(event) {
    setDisable(true);
    const result = await token.payOut();
    setButtonText(result);
  }

  return (
    <div className="blue window">
      <h2>
        <span role="img" aria-label="tap emoji">
          🚰
        </span>
        Faucet
      </h2>
      <label>Get your free DCash tokens here! Claim 10,000 DCASH coins to your account.</label>
      <p className="trade-buttons">
        <button id="btn-payout" onClick={handleClick} disabled={isDisabled}>
         {buttonText}
        </button>
      </p>
    </div>
  );
}

export default Faucet;
