VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5745
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   5745
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView ListView1 
      Height          =   2595
      Left            =   120
      TabIndex        =   0
      Top             =   300
      Width           =   5475
      _ExtentX        =   9657
      _ExtentY        =   4577
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      AllowReorder    =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Column 1"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Column 2"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Column 3"
         Object.Width           =   2540
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" _
   (ByVal hWndParent As Long, ByVal hwndChildAfter As Long, _
   ByVal lpszClass As String, ByVal lpszWindow As String) As Long

Dim m_HdrHwnd As Long
Public TT As CTooltip

Private Sub Form_Load()
   m_HdrHwnd = FindWindowEx(ListView1.hwnd, 0, "msvb_lib_header", vbNullString)
   Hook m_HdrHwnd
   
   Set TT = New CTooltip
   TT.Style = TTBalloon
   TT.Icon = TTIconInfo
End Sub

Private Sub Form_Unload(Cancel As Integer)
   Unhook m_HdrHwnd
End Sub
