using UnityEngine;
using UnityEngine.UI;

public class ButtonManager : MonoBehaviour
{
    public FilePicker filePicker;
    public Button saveButton;
    public Button loadButton;

    void Start()
    {
        saveButton.onClick.AddListener(filePicker.SaveData);
        loadButton.onClick.AddListener(filePicker.LoadData);
    }
}
