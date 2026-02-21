# ContractReader

**Paste any legal contract. Get a plain-English summary and red flag analysis in seconds.**

No law degree required. ContractReader breaks down complex legal language, extracts key terms, and flags risky clauses — so you know exactly what you're signing before you sign it.

---

## What It Does

| Feature | Description |
|---------|-------------|
| Plain-English Summary | Who, what, how long, how much — in plain language |
| Key Terms Extraction | Payment, termination, IP, governing law |
| Red Flag Analysis | Risky clauses scored HIGH / CAUTION / OK |
| Risk Score | Overall contract risk rated 0-100 |
| Negotiation Tips | Specific language to ask for on each red flag |

---

## Quick Start

**Option 1 — Copy-paste (fastest)**

Just paste the contract text into your AI chat and say:
> "Review this contract"

**Option 2 — From a file (Windows)**

```powershell
.\extract-text.ps1 -FilePath "C:\Documents\vendor-agreement.txt"
```

Then copy the extracted text into your chat.

**Option 3 — From a file (Linux/Mac)**

```bash
bash extract-text.sh /path/to/contract.pdf
```

---

## Sample Output

```
CONTRACT REVIEW
===============
Parties: Acme Corp and Vendor LLC
Type: SaaS Service Agreement
Term: 12 months, auto-renews annually
Value: $2,400/year

SUMMARY
-------
Acme Corp agrees to pay Vendor LLC $200/month for access to their platform.
The agreement runs for one year and renews automatically unless cancelled
30 days before the renewal date. Vendor can terminate for any reason with
30 days notice. Acme can only terminate for cause.

RED FLAGS
---------
🔴 One-sided termination — Vendor can exit for any reason; you can only exit for breach.
🔴 Auto-renewal opt-out window is only 30 days — easy to miss.
🟡 Liability capped at 1 month of fees — may be too low for data loss scenarios.
🟢 IP ownership is clear — your data remains yours.

RISK SCORE: 55 / 100 — Moderate Risk

RECOMMENDATIONS
---------------
1. Request mutual termination rights with 30 days notice for either party.
2. Extend the auto-renewal opt-out window to 60-90 days.
3. Negotiate liability cap to 3-6 months of total fees paid.
```

---

## Red Flags Detected

- Auto-renewal with short opt-out window
- One-sided termination rights
- Uncapped or low liability
- Broad IP assignment
- Missing payment milestones
- Unlimited exclusivity
- Liquidated damages
- Automatic price escalation
- Missing SLA / performance standards
- Unilateral amendment rights
- Overly broad non-disparagement
- Unfavorable jurisdiction

---

## Disclaimer

ContractReader provides AI-assisted analysis for informational purposes only. It is not legal advice. For contracts with significant financial or legal exposure, consult a licensed attorney.

---

Built by [@drizzy8423](https://x.com/sheeptweetZ) | Powered by [LarryBrain](https://larrybrain.com)
