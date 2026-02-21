# ContractReader

Paste any legal contract and get an instant plain-English summary plus a list of red flag clauses. No law degree required.

## When to use this skill

- Reviewing vendor contracts, SaaS agreements, or NDAs before signing
- Analyzing employment agreements or consulting contracts
- Checking client contracts for risky or one-sided terms
- Quick due diligence on any legal document

## How to use

Paste the full contract text (or a section) into the chat and say:
- "Review this contract"
- "What are the red flags in this agreement?"
- "Summarize this NDA"
- "Is this contract fair?"

You can also pass a file path to extract-text.ps1 (Windows) or extract-text.sh (Linux/Mac) to pull text from a .txt or .pdf file first.

## What ContractReader analyzes

### 1. Plain-English Summary
- Who are the parties and what is the agreement?
- What does each party have to do?
- How long does the contract last?
- How does it end?
- What does it cost?

### 2. Key Terms Extracted
- **Effective date and term length**
- **Payment terms** — amounts, due dates, late fees
- **Termination clauses** — who can end it, how much notice, and why
- **Liability caps** — limits on damages, indemnification
- **IP ownership** — who owns work product, inventions, improvements
- **Non-compete / non-solicitation** — scope and duration
- **Governing law** — which state or country's laws apply
- **Dispute resolution** — arbitration, litigation, jurisdiction

### 3. Red Flag Analysis
Score each red flag as: 🔴 HIGH RISK | 🟡 CAUTION | 🟢 OK

Look for:
- **Auto-renewal with short opt-out window** — common gotcha, easy to miss
- **One-sided termination** — they can exit anytime, you can't
- **Uncapped liability** — you're on the hook for unlimited damages
- **Broad IP grab** — assigning ALL intellectual property, not just work product
- **Missing payment milestones** — no milestone = no leverage
- **Unlimited exclusivity** — prevents you from working with competitors forever
- **Liquidated damages clause** — predetermined penalties that may be excessive
- **Automatic price escalation** — costs go up without your approval
- **Missing SLA / performance standards** — no definition of "good enough"
- **Unilateral amendment rights** — they can change terms without your consent
- **Non-disparagement** — overly broad restrictions on what you can say publicly
- **Jurisdiction in unfavorable location** — forced to litigate in their backyard

### 4. Risk Score

Rate the overall contract:
- **Low Risk (80-100)** — standard terms, nothing unusual
- **Moderate Risk (50-79)** — some items to negotiate, proceed with awareness
- **High Risk (0-49)** — significant red flags, consider legal review before signing

### 5. Negotiation Suggestions

For each red flag, suggest what to ask for instead:
- "Request a mutual termination clause"
- "Cap liability at the contract value"
- "Limit IP assignment to work product only"
- "Add a 60-day opt-out window before auto-renewal"

## Output format

```
CONTRACT REVIEW
===============
Parties: [Party A] and [Party B]
Type: [NDA / Service Agreement / Employment / etc.]
Term: [Duration]
Value: [Dollar amount if applicable]

SUMMARY
-------
[2-4 sentences in plain English]

KEY TERMS
---------
Payment:     [terms]
Termination: [terms]
IP:          [terms]
Governing:   [law/jurisdiction]

RED FLAGS
---------
[emoji] [Clause name] — [Plain explanation of the risk]
[emoji] [Clause name] — [Plain explanation of the risk]

RISK SCORE: [X] / 100 — [Low / Moderate / High] Risk

RECOMMENDATIONS
---------------
1. [Specific negotiation suggestion]
2. [Specific negotiation suggestion]
3. [Specific negotiation suggestion]

DISCLAIMER: This is AI-assisted analysis for informational purposes only.
For contracts above $10,000 or with significant legal exposure, consult a licensed attorney.
```

## Notes

- Works best with full contract text pasted directly
- For PDFs, use the included extraction scripts to get plain text first
- Focus on the red flags section — that's where the value is
- Always include the disclaimer when sharing output with others
